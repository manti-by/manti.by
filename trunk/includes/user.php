<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Class for user operations
      * NOTICE: This class implemented as Singleton
      * @name $database
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      */
    
    class User extends Application {
        private $id;
        private $username;
        private $email;
        private $password;
        private $group;
            
        protected static $instance = null;

        /**
          * Singleton protection
          */
        private function __construct($id = null) {
            // Get db handler
            $this->database = Database::getInstance();
        }
        private function __clone() {}
        private function __wakeup() {}
        
        /**
          * GetInstance class method
          * @return object $instance
          */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new User;
            }
            return self::$instance;
        }
        
        /**
          * Create user by email and pass
          * @param array $options
          * @return int $uid or 0 if not exist
          */
        public function create($options) {
            // get items
            $config = System::getInstance()->getConfig();
            $this->database->query("
                INSERT INTO #__user (`username`, `email`, `password`)
                VALUES ('".$options['username']."', '".$options['email']."', '".md5($config['secret'].$options['password'])."')");
            
            $result = $this->database->getResult();
            if ($result) {
                return $this->database->getLastInsertId();
            } else {
                return false;
            }
        }
        
        /**
          * Get user id by email and pass or cookie token
          * @param array $options[email+password || cookie] OPTIONAL
          * @return int $user_id or 0 if not exist
          */
        public function getId($options = null) {
            // check email & pass
            $config = System::getInstance()->getConfig();
            if (isset($options['email']) && isset($options['password'])) {
                $this->database->query("
                    SELECT `id` 
                    FROM `#__user`
                    WHERE `email` = '".$options['email']."'
                      AND `password` = '".md5($config['secret'].$options['password'])."'
                    LIMIT 0, 1");

                $result = $this->database->getField();
                if ($result) {
                    return $result;
                }
            }
            
            // check cookie
            if (isset($options['cookie'])) {
                $this->database->query("
                    SELECT `id` 
                    FROM `#__user` 
                    WHERE MD5(CONCAT('".$config['secret']."', `email`)) = '".$options['cookie']."'
                    LIMIT 0, 1");

                $result = $this->database->getField();
                if ($result) {
                    return $result;
                }
            }
            
            // check username
            if (isset($options['username'])) {
                $this->database->query("
                    SELECT `id` 
                    FROM `#__user` 
                    WHERE `username` = '".$options['username']."'
                    LIMIT 0, 1");

                $result = $this->database->getField();
                if ($result) {
                    return $result;
                }
            }
            
            // check internal id
            if ((int)$this->id > 0) {
                return $this->id;
            }
            
            // check session
            if (isset($_SESSION['user_id']) && $_SESSION['user_id'] > 0) {
                return $_SESSION['user_id'];
            }
            
            return false;
        }
        
        /**
          * Load user data to self object by id
          * @param int $user_id
          * @return object $data or false if not exist
          */
        public function load($id) {
            // check id
            if (empty($id)) {
                return $this->_throw('User id could not be empty', NOTICE);
            }
            
            // get items
            $this->database->query("
                SELECT u.*, g.`name` AS `group` 
                FROM `#__user` AS u
                JOIN `#__group` AS g ON g.`id` = u.`group_id`
                WHERE u.`id` = $id
                LIMIT 0, 1");
            
            $result = $this->database->getObject();
            if ($result) {
                // add data to object
                $this->id = $result->id;
                $this->username = $result->username;
                $this->email = $result->email;
                $this->password = $result->password;
                $this->group = $result->group;
                
                // return data
                return $result;
            } else {
                return false;
            }
        }
        
        /**
          * Setup user session by id
          * @param int $user_id
          * @return object $data or false if not exist
          */
        public function setupSession($id, $remember = true) {
            // get config
            $config = System::getInstance()->getConfig();
            
            // set session
            $_SESSION['user_id'] = $id;
            
            // set cookie
            if ($remember) {
                setCookie('auth_token', md5($config['secret'].$options['email']));
            } else {
                setCookie('auth_token', '');
            }
                
            // add info to user object
            return $this->load($id);
        }
        
        /**
          * Check user session and try to setup it
          * @return bool $result
          */
        public function checkSession() {
            // check local data
            if (empty($this->id) ||
                empty($this->username) ||
                empty($this->email) ||
                empty($this->password) ||
                empty($this->group)) {
                   // try to load
                   return $this->load($_SESSION['user_id']);
            }
            return true;
        }
        
        /**
          * Clear user session data
          * @return bool TRUE
          */
        public function clearSession() {
            // clear session data
            setCookie('token', '');
            $_SESSION['user_id'] = 0;
            
            // clear user object
            $this->id = null;
            $this->username = null;
            $this->email = null;
            $this->password = null;
            $this->group = null;
                
            return true;
        }
        
        /**
          * Clear user session data
          * @return bool $result
          */
        public function isLoggined() {
            // get cookie uid
            if (isset($_COOKIE['token']) && $this->getId(array('cookie' => $_COOKIE['token'])) > 0) {
                return true;
            }

            // check session
            if (isset($_SESSION['user_id']) && $_SESSION['user_id'] > 0) {
                $this->id = $_SESSION['user_id'];
                return $this->checkSession();
            }

            return false;
        }

        /**
          * Check user by email
          * @param array $email
          * @return bool $result
          */
        public function checkEmail($email) {
            // get items
            $this->database->query("
                SELECT `id` FROM `#__user` 
                WHERE `email` = '".$email."' 
                LIMIT 0, 1");
            
            $result = $this->database->getResult();
            return ($result ? true : false);
        }
        
        /**
          * Set new pass for user by email
          * @param string $email
          * @param string $password
          * @return bool $result
          */
        public function setNewPassword($email, $password) {
            // get items
            $this->database->query("
                UPDATE `#__user` 
                SET `password` = '".$password."'
                WHERE `email` = '".$email."'
                LIMIT 0, 1");
            
            $result = $this->database->getResult();
            return ($result ? true : false);
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
          * Get user IP
          * @return string $ip
          */
        public function getIp() {
            if (isset($_SERVER['HTTP_CLIENT_IP'])) {
                return $_SERVER['HTTP_CLIENT_IP'];
            } elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                return $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
                return $_SERVER['REMOTE_ADDR'];
            }
        }

        /**
          * Get user browser
          * @return string $user_agent
          */
        public function getUserAgent() {
            return (isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : false);
        }

        /**
          * Get referer
          * @return string $referer
          */
        public function getReferer() {
            return (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : false);
        }
    }
