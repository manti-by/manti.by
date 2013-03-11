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
     * View class
     * @name $view
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class View extends Application {

        const OUTPUT_TYPE_DEFAULT   = 'page';
        const OUTPUT_TYPE_HTML      = 'html';
        const OUTPUT_TYPE_JSON      = 'json';
        const OUTPUT_TYPE_RAW       = 'raw';
        const OUTPUT_TYPE_LOG       = 'log';

        /**
         * Default getView method
         * @param string $name
         * @return object $view
         */
        public static function getView($name = null) {
            // get class name
            $view_name = (string)ucfirst($name) . 'View';
            return new $view_name();
        }

        /**
         * Render action
         * @param array $options
         */
        public function render($options = null) {
            // check empty format
            if (!isset($options['output'])) {
                $options['output'] = 'page';
            }

            // route output
            switch ($options['output']) {
                default:
                case self::OUTPUT_TYPE_DEFAULT:
                    // Set headers
                    header('HTTP/1.1 200 OK');
                    header('Content-Type: text/html; charset=UTF-8');
                    header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
                    header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
                    header('Cache-Control: no-cache, must-revalidate');
                    header('Pragma: no-cache');

                    echo $this->wrapPage($options);
                    break;
                case self::OUTPUT_TYPE_HTML:
                    // Set headers
                    header('HTTP/1.1 200 OK');
                    header('Content-Type: text/html; charset=UTF-8');
                    header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
                    header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
                    header('Cache-Control: no-cache, must-revalidate');
                    header('Pragma: no-cache');

                    // output html data
                    echo $options['body'];
                    break;
                case self::OUTPUT_TYPE_JSON:
                    // set headers
                    header('HTTP/1.1 200 OK');
                    header('Content-type: application/json');

                    // output json data
                    echo json_encode($options['data']);
                    break;
                case self::OUTPUT_TYPE_RAW:
                    // output raw data
                    echo $options['data'];
                    break;
                case self::OUTPUT_TYPE_LOG:
                    // Add log record
                    $this->saveToLog($options['data']);
                    break;
            }
            return;
        }

        /**
         * Render items array
         * @param array $options
         * @return string $html
         */
        public function renderItemsArray($options) {
            // get entity
            if (empty($options['module'])) {
                return $this->_throw(T('Template for list rendering not found'));
            }

            // if no items
            if (empty($options['data']) || count($options['data']) == 0) {
                $options['data'] = T('There are no contents found');
                return $this->getContents($options['module'], 'list', $options);
            }

            // render each item
            $items_html = '';
            foreach($options['data'] as $item) {
                $items_html .= $this->getContents($options['module'], 'item', array('data' => $item));
            }

            // render category
            $options['data'] = $items_html;
            return $this->getContents($options['module'], 'list', $options);
        }

        /**
         * Wrap HTML data to Page
         * @param array $options
         * @return string $html
         */
        public function wrapPage($options) {
            // get form contents
            return $this->getContents(null, 'index', $options);
        }

        /**
         * Add sidebar to Page
         * @param array $options
         * @return array $options
         */
        public function wrapSidebar($options) {
            // Get sidebar wrapper with contents
            $options['body'] = $this->getContents(null, 'sidebar', $options);
            return $options;
        }

        /**
         * Get HTML contents for TYPE/NAME entity
         * @param string $type
         * @param string $name
         * @param array $options
         * @return string $html
         */
        public function getContents($type, $name, $options = null) {
            // get content type
            $type = (!empty($type) ? $type . DS : '');
            $name = (!empty($name) ? $name : 'index');

            // compile template prefix and postfix
            $prefix = Application::$config['doc_root'] . DS . 'templates' . DS;
            $postfix = DS . $type . $name . '.php';
            if (isset($options['template']) && !empty($options['template'])) {
                $content_template_name = realpath($prefix . $options['template'] . $postfix);
            } else {
                $content_template_name = false;
            }
            $default_template_name = realpath($prefix . Application::$config['template'] . $postfix);

            // check content file existance
            if ($content_template_name && file_exists($content_template_name)) {
                $content_file_name = $content_template_name;
            } elseif (file_exists($default_template_name)) {
                $content_file_name = $default_template_name;
            } else {
                $content_file = array(
                    (!empty($options['template']) ? $options['template'] : Application::$config['template']),
                    (!empty($type) ? $type : 'none'),
                    (!empty($name) ? $name : 'Undefined')
                );
                return $this->_throw('Template file for ' . implode('/', $content_file) . ' not found');
            }

            // render to buffer
            ob_start();

            // get contents
            include $content_file_name;
            $result = ob_get_contents();

            // clean buffer
            ob_end_clean();

            return $result;
        }

        /**
         * Offline render action
         * @param array $options OPTIONAL
         * @return array|null $options
         */
        public function offline($options = null) {
            $options['data'] = $this->getLastFromStack();
            $options['body'] = $this->getContents('partial', 'offline', $options);
            return $options;
        }

        /**
         * 404 Page
         * @param array $options OPTIONAL
         * @return array|null $options
         */
        public function _404($options = null) {
            $options['body'] = $this->getContents('partial', '404', $options);
            return $options;
        }
    }