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
     * Sitemap Controller class
     * @name $sitemapController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3b
     */
    class SitemapController extends Controller {

        /**
         * Default sitemap module action
         * @param array $options
         * @return array $result
         */
        public function indexAction($options) {
            $options['title'] = T('Sitemap');
            $options['data'] = $this->model->getSitemap();
            $options['body'] = $this->view->getContents('sitemap', 'list', $options);
            return $options;
        }

        /**
         * Generate XML sitemap action
         * @param array $options
         * @return array $result
         */
        public function generateAction($options) {
            // Catch system messages
            ob_start();

            // Set JSON output
            $options['output'] = View::OUTPUT_TYPE_JSON;

            // Check login state
            if (!UserEntity::getInstance()->isLoggined()) {
                // Compile error response
                $options['data'] = array(
                    'result' => 'error',
                    'message' => T('You do not have permissions to view this page')
                );
            } else {
                // Run actions and compile response
                try {
                    $sitemap = ROOT_PATH . DS . 'sitemap.xml';

                    // Delete old map
                    if (file_exists($sitemap)) unlink($sitemap);

                    // Create new
                    if (file_put_contents($sitemap, $this->model->getXML())) {
                        $options['data'] = array(
                            'result'  => 'success',
                            'message' => T('Sitemap succefully generated')
                        );
                    } else {
                        $options['data'] = array(
                            'result'  => 'error',
                            'message' => T('Please check file permissions')
                        );
                    }
                } catch (Exception $e) {
                    $options['data'] = array(
                        'result'  => 'error',
                        'message' => $e->getMessage()
                    );
                }
            }

            // Flush system messages to log
            if ($message = ob_get_contents()) $this->_throw($message);
            ob_end_clean();

            return $options;
        }
    }
