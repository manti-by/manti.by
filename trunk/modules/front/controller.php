<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Front Controller class
      * @name $frontController 
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class FrontController extends Controller {

        public function dispatch() {
            // get action
            $options['action'] = $this->system->getCmd('action'); 
            
            // route action
            $method = $options['action'].'Action';
            if (is_callable(array($this, $method))) {
                return $this->$method($options);
            } else {
                return $this->indexAction($options);
            }
        }

        private function indexAction($options) {
            // get frontpage contents items
            $options['title'] = 'Default Frontpage of M2 Micro Framework';
            $options['body'] = '<h1>Default Frontpage of M2 Micro Framework</h1>';
            return $options;
        }
    }
