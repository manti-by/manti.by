<?php
    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @version     0.3
     * @package     M2 Micro Framework
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     *
     * NEW BSD LICENSE
     *
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions are met:
     *  * Redistributions of source code must retain the above copyright
     * notice, this list of conditions and the following disclaimer.
     *  * Redistributions in binary form must reproduce the above copyright
     * notice, this list of conditions and the following disclaimer in the
     * documentation and/or other materials provided with the distribution.
     *  * Neither the name of the "M2 Micro Framework" nor "manti.by" nor the
     * names of its contributors may be used to endorse or promote products
     * derived from this software without specific prior written permission.

     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
     * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
     * DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
     * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
     * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
     * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
     * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
     * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */

    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Stats Model class
     * @name $statsModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.5
     */
    class StatsModel extends Model {

        const OTHER_SESSION_ID = 'other-session-id';
        const OTHER_SESSION_IP = '127.0.0.1';

        /**
         * Process daily statistics
         * @return array
         */
        public function processDailyStats() {
            // Get dates
            $start_date = date('Y-m-d', time() - 10 * 60 * 60 * 24);
            $end_date = date('Y-m-d');

            // Get stats and compile metrics
            $result = array('browsers' => array(), 'sessions' => array());
            $stats = $this->getStats($start_date, $end_date);
            if ($stats) {
                foreach ($stats as $item) {
                    // Check browser
                    $browser = get_browser($item->browser, true);
                    if (array_key_exists($browser['browser'], $result['browsers'])) {
                        if (array_key_exists($browser['version'], $result['browsers'][$browser['browser']])) {
                            $result['browsers'][$browser['browser']][$browser['version']]++;
                        } else {
                            $result['browsers'][$browser['browser']][$browser['version']] = 1;
                        }
                    } else {
                        $result['browsers'][$browser['browser']] = array($browser['version'] => 1);
                    }

                    // Check user sessions
                    if (array_key_exists($item->ip, $result['sessions'])) {
                        if (array_key_exists($item->sessionid, $result['sessions'][$item->ip])) {
                            $result['sessions'][$item->ip][$item->sessionid]++;
                        } else {
                            $result['sessions'][$item->ip][$item->sessionid] = 1;
                        }
                    } else {
                        $result['sessions'][$item->ip] = array($item->sessionid => 1);
                    }
                }
            }

            // Insert browser stats to DB
            if (count($result['browsers']) > 0) {
                foreach($result['browsers'] as $browser => $data) {
                    foreach($data as $version => $count) {
                        $this->database->query("CALL UPSERT_BROWSER_STAT('" . $browser . "', '" . $version . "', " . $count . ");");
                    }
                }
            }

            // Insert session stats to DB
            if (count($result['sessions']) > 0) {
                // Trim "small" counters
                $result['sessions'][self::OTHER_SESSION_IP] = array(self::OTHER_SESSION_ID => 0);
                foreach($result['sessions'] as $ip => $data) {
                    foreach($data as $session => $count) {
                        if ($count <= 1) {
                            $result['sessions'][self::OTHER_SESSION_IP][self::OTHER_SESSION_ID]++;
                            unset($result['sessions'][$ip][$session]);
                        }
                    }
                }

                // Insert result into DB
                foreach($result['sessions'] as $ip => $data) {
                    foreach($data as $session => $count) {
                        // Get IP country
                        $country = System::getInstance()->getCountry($ip);
                        $this->database->query("CALL UPSERT_SESSION_STAT('" . $session . "', '" . $ip . "', '" . $country . "', " . $count . ");");
                    }
                }
            }

            return $result;
        }

        /**
         * Get log stats
         * @param string $start_date
         * @param string $end_date
         * @return array|bool
         */
        private function getStats($start_date, $end_date) {
            $this->database->query("CALL GET_STATS('" . $start_date . "', '". $end_date ."');");
            return $this->database->getObjectsArray();
        }

        /**
         * Get browsers chart data
         * @param int $limit
         * @return string
         */
        public function getBrowsersChartData($limit = 10) {
            // Get data
            $this->database->query("CALL GET_BROWSER_STATS(" . $limit . ");");
            $browsers = $this->database->getObjectsArray();

            // Compile result
            $result = array(array(T('Browser'), T('Hits')));
            foreach ($browsers as $item) {
                $result[] = array($item->browser, (int)$item->count);
            }

            return json_encode($result);
        }

        /**
         * Get browsers chart data
         * @param int $limit
         * @return string
         */
        public function getSessionsChartData($limit = 10) {
            // Get data
            $this->database->query("CALL GET_SESSION_STATS(" . $limit . ");");
            $sessions = $this->database->getObjectsArray();

            // Compile result by visitors
            $visitors = $head = $dates = array();
            foreach ($sessions as $item) {
                // Format date
                $date = date('d-m-Y', strtotime($item->timestamp));

                // Calculate counters
                if (array_key_exists($item->visitor, $visitors)) {
                    if (array_key_exists($date, $visitors[$item->visitor])) {
                        $visitors[$item->visitor][$date] += (int)$item->count;
                    } else {
                        $visitors[$item->visitor] = array($date => (int)$item->count);
                    }
                } else {
                    $visitors[$item->visitor] = array($date => (int)$item->count);
                }

                // Create dates array
                if (!array_key_exists($date, $dates)) {
                    $dates[$date] = array();
                }
            }

            // Pivot data and compile dates
            $head[] = T('Date');
            foreach ($visitors as $visitor => $data) {
                $head[] = $visitor;
                foreach($dates as $date => $array) {
                    if (array_key_exists($date, $data)) {
                        $dates[$date][] = $data[$date];
                    } else {
                        $dates[$date][] = 0;
                    }
                }
            }

            // Compile result and return
            $result = array($head);
            foreach ($dates as $date => $values) {
                $result[] = array_merge(array($date), $values);
            }

            return json_encode($result);
        }
    }
