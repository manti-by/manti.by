<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * User Controller class
     * @name $userController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class UserController extends Controller {

        public function indexAction($options) {
            return $this->dashboardAction($options);
        }

        public function dashboardAction($options) {
            // Check login state
            if (!$this->model->isLoggined()) {
                $this->_throw(T('You currently not loggined'));
                return $this->loginformAction($options);
            }
            
            // Show dashboard
            $options['title'] = 'Your Dashboard';
            $options['body'] = $this->view->getContents('user', 'dashboard', $options);
            return $options;
        }

        public function loginformAction($options) {
            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
            // Get login form
            $options['title'] = 'Login page';
            $options['body'] = $this->view->getContents('user', 'login', $options);
            return $options;
        }

        public function loginAction($options) {
            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
            // Get credentials
            $options['email'] = System::getInstance()->getCmd('email');
            $options['password'] = System::getInstance()->getCmd('password');
            $options['remember'] = (System::getInstance()->getCmd('remember') ? true : false);
            
            if (isset($_COOKIE['auth_token']) && !empty($_COOKIE['auth_token'])) {
                $options['cookie'] = $_COOKIE['auth_token'];
            } else {
                $options['cookie'] = NULL;
            }
            
            // Check login
            if ($this->model->login($options)) {
                $this->_clean(T('You succesfully logined'));
            } else {
                $this->_throw(T('Could not find user with given credentials'), ERROR);
            }
            
            // Redirect to frontpage
            return $this->loadModule('front')->indexAction($options);
        }

        public function logoutAction($options) {
            // Check login state
            if (!$this->model->isLoggined()) {
                $this->_throw(T('You currently not loggined'));
                return $this->loginformAction($options);
            }
            
            // Get login form
            if ($this->model->logout($options)) {
                $this->_clean(T('You succesfully leave closed areas'));
                return $this->loginformAction($options);
            } else {
                $this->_throw(T('Could not delete your user session'), ERROR);
                return $this->logouformAction($options);
            }
        }

        public function forgotformAction($options) {
            // Get login form
            $options['title'] = 'Forgot password page';
            $options['body'] = $this->view->getContents('user', 'forgot', $options);
            return $options;
        }

        public function forgotAction($options) {
            // Get email
            $options['email'] = System::getInstance()->getCmd('email', $options['email']);
            
            // Check valid email
            if (!System::getInstance()->isValidEmail($options['email'])){
                $this->_throw(T('Please enter valid email address'), ERROR);
                return $this->forgotformAction($options);
            }
            
            // check existing email
            if ($this->model->checkEmail($options['email'])){
                if ($this->model->createNewPassword($options['email'])) {
                    $this->_clean(T('Your new password has been sent to given email'));
                    return $this->loginformAction($options);
                } else {
                    $this->_throw(T('Could not reset your password, please try later'), ERROR);
                    return $this->forgotformAction($options);
                }
            } else {
                // Simple acl hook
                sleep(3);
                
                // Return error message
                $this->_throw(T('User with given email not found'), ERROR);
                return $this->registerformAction($options);
            }
        }

        public function registerformAction($options) {
            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
            // Get login form
            $options['title'] = 'Register page';
            $options['body'] = $this->view->getContents('user', 'register', $options);
            return $options;
        }

        public function registerAction($options) {
            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->logoutformAction($options);
            }
            
            // Get credentials
            $options['username'] = System::getInstance()->getCmd('username', $options['username']);
            $options['email'] = System::getInstance()->getCmd('email', $options['email']);
            $options['password'] = System::getInstance()->getCmd('password', $options['password']);
            
            // Check valid username
            if (preg_match('/[^a-z]/i', $options['username'])){
                $this->_throw(T('Please enter valid username'), ERROR);
                return $this->registerformAction($options);
            }
            
            // Check valid email
            if (!System::getInstance()->isValidEmail($options['email'])){
                $this->_throw(T('Please enter valid email address'), ERROR);
                return $this->registerformAction($options);
            }
            
            // Check existing email
            if ($this->model->checkEmail($options['email'])){
                $this->_throw(T('User with given email already registered'), ERROR);
                return $this->registerformAction($options);
            }
            
            // Check login
            if ($this->model->create($options)) {
                $this->_clean(T('You succesfully registered'));
            } else {
                $this->_throw(T('Registration currently not available'), ERROR);
            }
            
            // Redirect to blog
            return $this->logoutformAction($options);
        }
    }
