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
                return $this->indexAction($options);
            }
        }

        private function indexAction($options) {
            return $this->dashboardAction($options);
        }
        
        private function dashboardAction($options) {
            // check login state
            if (!$this->model->isLoggined()) {
                $this->_throw(T('You currently not loggined'));
                return $this->loginformAction($options);
            }
            
            // Show dashboard
            $options['title'] = 'Your Dashboard';
            $options['body'] = $this->view->getContents('user', 'dashboard', $options);
            return $options;
        }
        
        private function loginformAction($options) {
            // check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
            // get login form
            $options['title'] = 'Login page';
            $options['body'] = $this->view->getContents('user', 'login', $options);
            return $options;
        }
                
        private function loginAction($options) {
            // check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
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
                $this->_throw(T('Could not find user with given credentials'), ERROR);
            }
            
            // redirest to frontpage
            return $this->loadModule('front')->dispatch();
        }
        
        private function logoutformAction($options) {
            // check login state
            if (!$this->model->isLoggined()) {
                $this->_throw(T('You currently not loggined'));
                return $this->loginformAction($options);
            }
            
            // get login form
            $options['title'] = 'Logout page';
            $options['body'] = $this->view->getContents('user', 'logout', $options);
            return $options;
        }
        
        private function logoutAction($options) {
            // check login state
            if (!$this->model->isLoggined()) {
                $this->_throw(T('You currently not loggined'));
                return $this->loginformAction($options);
            }
            
            // get login form
            if ($this->model->logout($options)) {
                $this->_clean(T('You succesfully leave closed areas'));
                return $this->loginformAction($options);
            } else {
                $this->_throw(T('Could not delete your user session'), ERROR);
                return $this->logouformAction($options);
            }
        }
        
        private function forgotformAction($options) {
            // get login form
            $options['title'] = 'Forgot password page';
            $options['body'] = $this->view->getContents('user', 'forgot', $options);
            return $options;
        }
        
        private function forgotAction($options) {
            // get email
            $options['email'] = $this->system->getCmd('email', $options['email']);
            
            // check valid email
            if (!$this->system->isValidEmail($options['email'])){
                $this->_throw(T('Please enter valid email address'), ERROR);
                return $this->forgotformAction($options);
            }
            
            // check existing email
            if ($this->model->checkEmail($options['email'])){
                if ($this->model->createNewPassword($options['email'])) {
                    $this->_clean(T('Your new password sended to given email'));
                    return $this->loginformAction($options);
                } else {
                    $this->_throw(T('Could not reset your password, please try later'), ERROR);
                    return $this->forgotformAction($options);
                }
            } else {
                // simple acl hook
                sleep(3);
                
                // return error message
                $this->_throw(T('User with given email not found'), ERROR);
                return $this->registerformAction($options);
            }
        }
        
        private function registerformAction($options) {
            // check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
            // get login form
            $options['title'] = 'Register page';
            $options['body'] = $this->view->getContents('user', 'register', $options);
            return $options;
        }
        
        private function registerAction($options) {
            // check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
            // get credentials
            $options['username'] = $this->system->getCmd('username', $options['username']);
            $options['email'] = $this->system->getCmd('email', $options['email']);
            $options['password'] = $this->system->getCmd('password', $options['password']);
            $options['confirm'] = $this->system->getCmd('confirm', $options['confirm']);
            
            // check valid username
            if (preg_match('/[^a-z]/i', $options['username'])){
                $this->_throw(T('Please enter valid username'), ERROR);
                return $this->registerformAction($options);
            }
            
            // check valid email
            if (!$this->system->isValidEmail($options['email'])){
                $this->_throw(T('Please enter valid email address'), ERROR);
                return $this->registerformAction($options);
            }
            
            // check existing email
            if ($this->model->checkEmail($options['email'])){
                $this->_throw(T('User with given email already registered'), ERROR);
                return $this->registerformAction($options);
            }
            
            // check passwords
            if ($options['password'] != $options['confirm']){
                $this->_throw(T('Passwords do not match'), ERROR);
                return $this->registerformAction($options);
            }
            
            // check login
            if ($this->model->create($options)) {
                $this->_clean(T('You succesfully registered'));
            } else {
                $this->_throw(T('Registration currently not available'), ERROR);
            }
            
            // redirect to blog
            return $this->logoutformAction($options);
        }
    }
