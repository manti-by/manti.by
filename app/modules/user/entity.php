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
     * Entity class for user operations
     * NOTICE: This class implemented as Singleton
     * @name $database
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.2RC2
     */
    
    class UserEntity extends Entity {

        /**
         * @var int $id user ID
         */
        private $id;

        /**
         * @var string $username user name
         */
        private $username;

        /**
         * @var string $email user email
         */
        private $email;

        /**
         * @var string $password pass hash
         */
        private $password;

        /**
         * @var string $group user group name
         */
        private $group;

        /**
         * @var bool $is_loaded is user profile loaded
         */
        private $is_loaded = false;

        /**
         * @var object $instance self pointer
         */
        protected static $instance = null;

        /**
         * Singleton protection
         * @param int $id user ID for load
         */
        protected function __construct($id = null) {
            // Get db handler
            $this->database = Database::getInstance();

            // Check user login state and setup session
            $this->isLoggined();
            $this->checkSession();
        }
        
        /**
          * GetInstance class method
          * @return UserEntity $instance
          */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new UserEntity;
            }
            return self::$instance;
        }
        
        /**
         * Create user by email and pass
         * @param array $options
         * @return int $uid or 0 if not exist
         */
        public function create($options) {
            // Get items
            $this->database->query("CALL UPSERT_USER(0, '".$options['username']."','".$options['email']."','".md5(Application::$config['secret'].$options['password'])."');");
            return $this->database->getLastInsertId();
        }
        
        /**
         * Get user id by email and pass or cookie token
         * @param array $options OPTIONAL user credentials
         * @return int $user_id or 0 if not exist
         */
        public function getId($options = null) {
            // Check email & pass
            if (isset($options['email']) && isset($options['password'])) {
                $this->database->query("CALL CHECK_LOGIN('".$options['email']."','".md5(Application::$config['secret'].$options['password'])."');");
                $result = $this->database->getField();
                if (!empty($result)) {
                    return $result;
                }
            }
            
            // Check cookie
            if (isset($options['cookie'])) {
                $this->database->query("CALL CHECK_COOKIE('".$options['cookie']."', '".Application::$config['secret']."');");
                $result = $this->database->getField();
                if (!empty($result)) {
                    return $result;
                }
            }
            
            // Check username
            if (isset($options['username'])) {
                $this->database->query("CALL CHECK_USERNAME('".$options['username']."');");
                $result = $this->database->getField();
                if (!empty($result)) {
                    return $result;
                }
            }
            
            // Check internal id
            if ((int)$this->id > 0) {
                return $this->id;
            }
            
            // Check session
            if (isset($_SESSION['user_id']) && $_SESSION['user_id'] > 0) {
                return $_SESSION['user_id'];
            }
            
            return false;
        }
        
        /**
         * Load user data to self object by id
         * @param int $id user ID
         * @return UserEntity|bool $this or false
         */
        public function load($id) {
            // Get items
            $id = (int)$id;
            if (!$id) return false;

            $this->database->query("CALL GET_USER_BY_ID($id);");
            $result = $this->database->getObject();
            if (!empty($result) && is_object($result)) {
                // Add data to object
                $this->id = $result->id;
                $this->username = $result->username;
                $this->email = $result->email;
                $this->password = $result->password;
                $this->group = $result->group;

                // Set load state
                $this->is_loaded = true;
                
                // Return data
                return $result;
            } else {
                return false;
            }
        }
        
        /**
         * Setup user session by id
         * @param int $id user ID
         * @param bool $remember (optional) save session
         * @return UserEntity|bool $this or false
         */
        public function setupSession($id, $remember = true) {
            // Check user id
            if (empty($id)) {
                return $this->_throw(T('User ID could not be empty'), WARNING);
            }

            // Set session
            $_SESSION['user_id'] = $id;
            $result = $this->checkSession();
            if ($result) {
                // Set cookie
                if ($remember) {
                    setCookie('token', md5(Application::$config['secret'] . $result->email));
                } else {
                    setCookie('token', '');
                }

                return $this;
            } else {
                return $result;
            }
        }
        
        /**
         * Check user session and try to setup it
         * @return UserEntity|bool $this or false
         */
        public function checkSession() {
            // Check local data
            if (!$this->is_loaded) {
                return $this->load($_SESSION['user_id']);
            }

            return false;
        }
        
        /**
         * Clear user session data
         * @return bool TRUE
         */
        public function clearSession() {
            // Clear session data
            setCookie('token', '');
            $_SESSION['user_id'] = 0;
            
            // Clear user object
            $this->id = null;
            $this->username = null;
            $this->email = null;
            $this->password = null;
            $this->group = null;
            $this->is_loaded = false;
                
            return true;
        }
        
        /**
         * Clear user session data
         * @return UserEntity|bool $this or false
         */
        public function isLoggined() {
            // Get cookie uid
            if (isset($_COOKIE['token']) && $user_id = $this->getId(array('cookie' => utf8_encode($_COOKIE['token'])))) {
                $_SESSION['user_id'] = $user_id;
            }

            // Check session
            if (isset($_SESSION['user_id']) && $_SESSION['user_id'] > 0) {
                return $this->load($_SESSION['user_id']);
            }

            return false;
        }

        /**
         * Check user by email
         * @param array $email
         * @return bool $result
         */
        public function checkEmail($email) {
            // Get items
            $this->database->query("CALL CHECK_EMAIL('".$email."');");
            return ($this->database->getField() ? true : false);
        }
        
        /**
         * Set new pass for user by email
         * @param string $email
         * @param string $password
         * @return bool $result
         */
        public function setNewPassword($email, $password) {
            // Get items
            $this->database->query("CALL UPDATE_PASSWORD('".$email."','".md5(Application::$config['secret'] . $password)."');");
            return ($this->database->checkResult() ? true : false);
        }

        /**
         * Get user email
         * @return string $username
         */
        public function getEmail() {
            $this->checkSession();
            return $this->email;
        }

        /**
         * Get username
         * @return string $username
         */
        public function getUsername() {
            $this->checkSession();
            return $this->username;
        }

        /**
         * Get user group
         * @return string $username
         */
        public function getGroup() {
            $this->checkSession();
            return $this->group;
        }
        
        /**
         * Get user IP
         * @static
         * @return string $ip
         */
        public static function getIp() {
            if (php_sapi_name() != 'cli') {
                if (isset($_SERVER['HTTP_CLIENT_IP'])) {
                    return $_SERVER['HTTP_CLIENT_IP'];
                } elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                    return $_SERVER['HTTP_X_FORWARDED_FOR'];
                } else {
                    return $_SERVER['REMOTE_ADDR'];
                }
            } else {
                return '127.0.0.1';
            }
        }

        /**
         * Get user browser
         * @static
         * @return string|bool $user_agent
         */
        public static function getUserAgent() {
            return (isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : false);
        }

        /**
         * Get referer
         * @static
         * @return string|bool $referer
         */
        public static function getReferer() {
            return (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : false);
        }
    }
