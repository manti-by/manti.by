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
     * User Controller class
     * @name $userController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class UserController extends Controller {

        /**
         * Default user module action
         * @param array $options
         * @return array $result
         */
        public function indexAction($options) {
            return $this->dashboardAction($options);
        }

        /**
         * Show user dashboard
         * @param array $options
         * @return array $result
         */
        public function dashboardAction($options) {
            // Check login state
            if (!$this->model->isLoggined()) {
                $this->_throw(T('You currently not loggined'));
                return $this->loginformAction($options);
            }

            // Get stats data
            $options['data']['browsers'] = Model::getModel('stats')->getBrowsersChartData(15);
            $options['data']['sessions'] = Model::getModel('stats')->getSessionsChartData(10);
            $options['data']['visitors'] = Model::getModel('stats')->getSessionsChartDataByDay(10);

            // Downloads stats
            $options['data']['nginx'] = Model::getModel('file')->getNginxChartData(15);
            $options['data']['track'] = Model::getModel('file')->getTrackChartData(15);

            // Show dashboard
            $options['title'] = T('User dashboard');
            $options['body'] = $this->view->getContents('user', 'dashboard', $options);
            return $options;
        }

        /**
         * Login form page
         * @param array $options
         * @return array $result
         */
        public function loginformAction($options) {
            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->dashboardAction($options);
            }
            
            // Get login form
            $options['title'] = 'Login page';
            $options['body'] = $this->view->getContents('user', 'login', $options);
            return $options;
        }

        /**
         * Sign In action
         * @param array $options
         * @return array $result
         */
        public function loginAction($options) {
            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->dashboardAction($options);
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

        /**
         * Sign Out action
         * @param array $options
         * @return array $result
         */
        public function logoutAction($options) {
            // Check login state
            if (!$this->model->isLoggined()) {
                $this->_throw(T('You currently not loggined'));
                return $this->loginformAction($options);
            }
            
            // Get login form
            if ($this->model->logout()) {
                $this->_clean(T('You succesfully leave closed areas'));
                return $this->loginformAction($options);
            } else {
                $this->_throw(T('Could not delete your user session'), ERROR);
                return $this->dashboardAction($options);
            }
        }

        /**
         * Forgot password page
         * @param array $options
         * @return array $result
         */
        public function forgotformAction($options) {
            // Get login form
            $options['title'] = 'Forgot password page';
            $options['body'] = $this->view->getContents('user', 'forgot', $options);
            return $options;
        }

        /**
         * Forgot action
         * @param array $options
         * @return array $result
         */
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

        /**
         * Sign Up page
         * @param array $options
         * @return array $result
         */
        public function registerformAction($options) {
            // Disable registration
            $this->_throw(T('Registration currently disabled'));
            return $this->loginformAction($options);

            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->dashboardAction($options);
            }
            
            // Get login form
            $options['title'] = 'Register page';
            $options['body'] = $this->view->getContents('user', 'register', $options);
            return $options;
        }

        /**
         * Sign Up action
         * @param array $options
         * @return array $result
         */
        public function registerAction($options) {
            // Disable registration
            $this->_throw(T('Registration currently disabled'));
            return $this->loginformAction($options);

            // Check login state
            if ($this->model->isLoggined()) {
                $this->_throw(T('You already logined'));
                return $this->dashboardAction($options);
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
            return $this->dashboardAction($options);
        }
    }
