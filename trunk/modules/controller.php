<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Default controller class
      * dispach first call and render output result
      * @name $controller
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class Controller extends Application {
        
        /**
          * Class constructor which loads MVC structure
          */
        public function  __construct() {
            // get class name
            $full_name = get_class($this);
            $this->name = strtolower(substr($full_name, 0, strpos($full_name, 'Controller')));
            
            // get system classes
            $this->system = System::getInstance();
            
            // get MVC classes
            $this->model = $this->getModel();
            $this->view = $this->getView();
        }
        
        /**
          * Dispatch action which load module called in cmd params
          * and render output result
          * @return bool $result
          */
        public function dispatch() {
            // we have startup errors
            if ($this->isMessagePresent()) {
                $this->view->offline();
                return false;
            }

            // load module
            $module = $this->loadModule($this->system->getCmd('module'));
            $result = $module->dispatch();

            // render page
            $this->view->render($result);
            return true;
        }
        
        /**
          * Method which load modules
          * @param string $module module name
          * @param string $default OPTIONAL default module name
          * @return object $module
          */
        private function loadModule($module, $default = null) {
            // get config
            $config = $this->system->getConfig();
            if (empty($module)) {
                if (empty($default)) {
                    $module = $config['default_module'];
                } else {
                    $module = $default;
                }
            }
            
            // check modules existance
            if (file_exists($config['doc_root'].DS.'modules'.DS.$module.DS.'controller.php')) {
                include_once $config['doc_root'].DS.'modules'.DS.$module.DS.'controller.php';
                $module_name = ucfirst($module).'Controller';
            } else {
                include_once $config['doc_root'].DS.'modules'.DS.$config['default_module'].DS.'controller.php';
                $module_name = ucfirst($default).'Controller';
            }
            
            return new $module_name();
        }
        
        /**
          * Default getModel method
          * @return object $model current model for controller
          */
        protected function getModel($name = null) {
            // get config
            $config = $this->system->getConfig();
            
            // check parent class
            if (empty($this->name) && empty($name)) {
                include_once $config['doc_root'].DS.'modules'.DS.'model.php';
            } elseif(!empty($name)) {
                include_once $config['doc_root'].DS.'modules'.DS.$name.DS.'model.php';
            } else {
                include_once $config['doc_root'].DS.'modules'.DS.$this->name.DS.'model.php';
            }
            
            // get class name
            if (!empty($name)) {
                $model_name = ucfirst($name).'Model';
            } else {
                $model_name = ucfirst($this->name).'Model';
            }
            return new $model_name();
        }

        /**
          * Default getView method
          * @return object $view current view for controller
          */
        protected function getView($name = null) {
            // get config
            $config = $this->system->getConfig();
            
            // check parent class
            if (empty($this->name) && empty($name)) {
                include_once $config['doc_root'].DS.'modules'.DS.'view.php';
            } elseif(!empty($name)) {
                include_once $config['doc_root'].DS.'modules'.DS.$name.DS.'view.php';
            } else {
                include_once $config['doc_root'].DS.'modules'.DS.$this->name.DS.'view.php';
            }
            
            // get class name
            if (!empty($name)) {
                $view_name = ucfirst($name).'View';
            } else {
                $view_name = ucfirst($this->name).'View';
            }
            
            return new $view_name();
        }
    }