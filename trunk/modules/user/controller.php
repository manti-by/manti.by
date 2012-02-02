<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc User Controller class
      * @name $userController 
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class UserController extends Controller {

        public function dispatch() {
            // get action
            $options['action'] = $this->system->getCmd('action'); 
            $method = $options['action'].'Action';
            
            // route action
            if (is_callable(array($this, $method))) {
                return $this->$method($options);
            } else {
                return $this->loginformAction($options);
            }
        }

        private function loginformAction($options) {
            // get login form
            $options['title'] = 'Login page';
            $options['body'] = $this->view->getContents('form', 'login', $options);
            return $options;
        }
        
        private function registerformAction($options) {
            // get login form
            $options['title'] = 'Register page';
            $options['body'] = $this->view->getContents('form', 'register', $options);
            return $options;
        }
        
        private function loginAction($options) {
            // get credentials
            $options['email'] = $this->system->getCmd('email');
            $options['password'] = $this->system->getCmd('password');
            $options['remember'] = ($this->system->getCmd('remember') ? true : false);
            
            if (isset($_COOKIE['auth_token']) && !empty($_COOKIE['auth_token'])) {
                $options['cookie'] = $_COOKIE['auth_token'];
            } else {
                $options['cookie'] = NULL;
            }
            
            // check login
            if ($this->model->login($options)) {
                $this->_clean(T('You succesfully logined'));
            } else {
                $this->_throw(T('Could not find user with given credentials'));
            }
            
            // redirest to frontpage
            return $this->loadModule('front')->dispatch();
        }
    }
