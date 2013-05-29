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
     * Default controller class
     * dispatch first call and render output result
     * @name $controller
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class Controller extends Application {
        /**
         * @var string $name class name
         */
        protected static $_name;

        /**
         * @var Model $model related model for controller
         */
        public $model;

        /**
         * @var View $view related view for controller
         */
        public $view;

        /**
         * Class constructor which loads MVC structure
         */
        public function  __construct() {
            // get class name
            $full_name = get_class($this);
            self::$_name = strtolower(substr($full_name, 0, strpos($full_name, 'Controller')));

            // get MVC classes
            $this->model = Model::getModel(self::$_name);
            $this->view  = View::getView(self::$_name);
        }

        /**
         * Overide non exist methods calls
         * @param string $name method name
         * @param string $args method args
         * @return array $options
         */
        public function __call($name, $args) {
            // Add redirect to 404 page
            header('HTTP/1.1 301 Moved Permanently');
            header('Location: ' . Application::$config['http_host'] . '/404/');
        }

        /**
         * Dispatch action which load module called in cmd params
         * and render output result
         */
        public function dispatch() {
            // We have startup errors
            if ($this->isMessagePresent()) {
                $result = $this->view->offline();
            } else {
                // Load module
                $request = System::getInstance()->getCmd('module', 'front');
                $module = $this->loadModule($request);
                if ($module) {
                    $result = $module->route();
                } else {
                    if ($request == '404') {
                        $result = $this->view->_404();
                    } else {
                        $this->__call('404', null);
                        return;
                    }
                }
            }
            $this->view->render($result);
        }

        /**
         * Route request to action
         */
        public function route() {
            // Append module name
            $options['module'] = System::getInstance()->getCmd('module', 'front');

            // Get action
            $options['action'] = System::getInstance()->getCmd('action', 'index');
            $method = $options['action'].'Action';

            return $this->$method($options);
        }

        /**
         * Method which load modules
         * @param string $module module name
         * @return BlogController|FileController|FrontController|GalleryController|TagController|UserController|bool $module
         */
        protected function loadModule($module) {
            // Check module name
            if (empty($module)) {
                if (empty($default)) {
                    $module_name = Application::$config['default_module'] . 'Controller';
                } else {
                    $module_name = $default . 'Controller';
                }
            } else {
                $module_name = $module . 'Controller';
            }

            if (class_exists($module_name)) {
                return new $module_name();
            } else {
                return false;
            }
        }

        /**
         * Check user permissions
         * @param array $options
         * @return bool|array $options
         */
        protected function checkPermissions($options) {
            // check login state
            if (!Model::getModel('user')->isLoggined()) {
                $this->_throw(T('You don\'t have permissions to view this page'));
                $options['access'] = 'denied';
                $options = $this->view->_404($options);
            } else {
                $options['access'] = 'granted';
            }
            return $options;
        }

        /**
         * Return JSON search results for query
         * @param array $options
         * @return array result
         */
        public function autocompleteAction($options) {
            $options['output'] = View::OUTPUT_TYPE_JSON;

            // Get query
            $query = System::getInstance()->getCmd('q');

            // Get category title
            if ($query) {
                $data = toJSNumArray($this->model->autocomplete($query));
                $options['data'] = array(
                    'result' => 'success',
                    'data'   => $data
                );
            } else {
                $options['data'] = array(
                    'result'  => 'error',
                    'message' => T('Empty query string')
                );
            }

            return $options;
        }
    }