<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * User Model class
     * @name $userModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class UserModel extends Model {
        private $entity = false;
        
        /**
         * Model class constructor with DB init
         */
        public function __construct() {
            // Get user helper
            $this->entity = UserEntity::getInstance();
            
            // Construct parent class
            parent::__construct();
        }
        
        public function isLoggined() {
            return $this->entity->isLoggined();
        }
        
        public function checkEmail($email) {
            return $this->entity->checkEmail($email);
        }
        
        public function create($options) {
            // Try create user
            $user_id = $this->entity->create($options);
            if ($user_id) {
                // Login if success
                $remember = (isset($options['remember']) ? $options['remember'] : false);
                return $this->entity->setupSession($user_id, $remember);
            }
            return false;
        }
        
        public function login($options) {
            // Check user
            $user_id = $this->entity->getId($options);
            if ($user_id) {
                // Login if success
                $remember = (isset($options['remember']) ? $options['remember'] : false);
                return $this->entity->setupSession($user_id, $remember);
            }
            return false;            
        }
        
        public function logout($options) {
            // Simply clear user session
            return $this->entity->clearSession();
        }
        
        public function createNewPassword($email) {
            // Generate and set new password
            $password = substr(md5(Application::$config['secret'] . time()), 0, Application::$config['new_pass_length']);
            $result = $this->entity->setNewPassword($email, $password);
            
            // Send message if success
            if ($result) {
                $title = T('Your new password on ') . Application::$config['site_title'];
                $message = T('Your new password is ') . $password;
                return System::getInstance()->mail($email, $title, $message);
            } else {
                return false;
            }
        }
    }