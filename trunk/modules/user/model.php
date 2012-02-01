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
        
        public function isLoggined() {
            $this->helper = User::getInstance();
            return $this->helper->isLoggined();
        }
        
        public function login($options) {
            $user_id = $this->helper->getId($options);
            if ($user_id) {
                $remember = (isset($options['remember']) ? $options['remember'] : false);
                $this->entity = $this->helper->setupSession($user_id, $remember);
            }
            return $this->entity;
        }
    }
