<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc User Model class
      * @name $userModel
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class UserModel extends Model {
        private $helper;
        private $entity = false;
        
        /**
          * Model class constructor with DB init
          */
        public function __construct() {
            // get user helper
            $this->helper = User::getInstance();
            
            // construct parent class
            parent::__construct();
        }
        
        public function isLoggined() {
            return $this->helper->isLoggined();
        }
        
        public function checkEmail($email) {
            return $this->helper->checkEmail($email);
        }
        
        public function create($options) {
            // try create user
            $user_id = $this->helper->create($options);
            if ($user_id) {
                // login if success
                $this->entity = $this->helper->setupSession($user_id, $remember);
                return $this->entity;
            }
            return false;
        }
        
        public function login($options) {
            // check user
            $user_id = $this->helper->getId($options);
            if ($user_id) {
                // login if success
                $remember = (isset($options['remember']) ? $options['remember'] : false);
                $this->entity = $this->helper->setupSession($user_id, $remember);
                return $this->entity;
            }
            return false;            
        }
        
        public function logout($options) {
            // simply clear user session
            return $this->helper->clearSession();
        }
        
        public function createNewPassword($email) {
            // get system helper & config
            $system = System::getInstance();
            $config = $system->getConfig();
            
            // generate and set new password
            $password = substr(md5($config['secret'] . time()), 0, 8);
            $result = $this->helper->setNewPassword($email, $password);
            
            // send message if success
            if ($result) {
                $title = T('Your new password on ').$config['site_title'];
                $message = T('Your new password is ').$password;
                return $system->mail($email, $title, $message);
            } else {
                return false;
            }
        }
    }