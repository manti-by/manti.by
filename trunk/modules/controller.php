<?php
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
         * Class name
         */
        protected static $_name;

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
         * @param $name method name
         * @param $args method args
         * @return array $options
         */
        public function __call($name, $args) {
            return $this->view->_404(array('page' => $name, 'args' => $args));
        }

        /**
         * Dispatch action which load module called in cmd params
         * and render output result
         */
        public function dispatch() {
            // we have startup errors
            if ($this->isMessagePresent()) {
                $this->view->offline();
            }

            // load module
            $module = $this->loadModule(System::getInstance()->getCmd('module'));
            $result = $module->route();

            // render page
            $this->view->render($result);
        }

        /**
         * Route request to action
         */
        public function route() {
            // get action
            $options['action'] = System::getInstance()->getCmd('action', 'index');
            $method = $options['action'].'Action';

            return $this->$method($options);
        }

        /**
         * Method which load modules
         * @param string $module module name
         * @return object $module
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

            return new $module_name();
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
    }