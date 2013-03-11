<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     * @version     0.3
     * @package     M2 Micro Framework
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

    /**
     * Tag Model class
     * @name $tagModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class TagModel extends Model {

        /**
         * Upsert tags and return its ids
         * @param string $tags comma separated list
         * @return array $result
         */
        public function processTags($tags) {
            $return = array();
            $this->database->query("CALL UPSERT_TAGS('". $tags ."');");
            $result = $this->database->getObjectsArray();
            if (!empty($result) && is_array($result)) {
                foreach ($result as $item) {
                    $return[] = $item->id;
                }
            }
            return $return;
        }

        /**
         * Get tags array by IDs string
         * @param string|array $ids
         * @return bool|array $tags
         */
        public function getTagsByIds($ids) {
            // Check if array
            if (is_array($ids)) {
                $ids = implode(',', $ids);
            }

            // Return result
            $result = false;
            if (!empty($ids)) {
                $this->database->query("CALL GET_TAGS_BY_IDS('". $ids ."');");
                $result =  $this->database->getPairs('id', 'name');
            }

            return is_array($result) ? $result : array();
        }

        /**
         * Get tags array by IDs string
         * @param int $id
         * @return bool|string $tag
         */
        public function getTagNameById($id) {
            // Check if array
            if ($id) {
                $tags = $this->getTagsByIds($id);
                return is_array($tags) ? current($tags) : false;
            }
            return false;
        }

        /**
         * Get tags array
         * @param int $limit OPTIONAL
         * @return bool|array $tags
         */
        public function getTags($limit = 10) {
            $this->database->query("CALL GET_TAGS($limit);");
            return $this->database->getObjectsArray();
        }

        /**
         * Tag aurocomlete data-provider
         * @param string $query
         * @return bool false
         */
        public function autocomplete($query = null) {
            $this->database->query("CALL SEARCH_TAGS('%". $query ."%');");
            return $this->database->getPairs('id', 'name');
        }
    }
