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
     * User Model class
     * @name $userModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class UserModel extends Model {

        /**
         * @var bool|UserEntity $entity pointer to user entity
         */
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

        /**
         * Check if user loggined
         * @return bool|UserEntity $result
         */
        public function isLoggined() {
            return $this->entity->isLoggined();
        }

        /**
         * Check email existance
         * @param string $email
         * @return bool
         */
        public function checkEmail($email) {
            return $this->entity->checkEmail($email);
        }

        /**
         * Create new user
         * @param array $options
         * @return bool|UserEntity $result
         */
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

        /**
         * Try to login current user
         * @param array $options
         * @return bool|UserEntity $result
         */
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

        /**
         * Logout current user
         * @return bool $result
         */
        public function logout() {
            // Simply clear user session
            return $this->entity->clearSession();
        }

        /**
         * Create new user pass by email
         * @param string $email
         * @return bool $result
         */
        public function createNewPassword($email) {
            // Generate and set new password
            $password = substr(md5(Application::$config['secret'] . time()), 0, Application::$config['new_pass_length']);
            $result = $this->entity->setNewPassword($email, $password);
            
            // Send message if success
            if ($result) {
                $title = T('Your new password on ') . Application::$config['site_title_' . Application::$config['language']];
                $message = T('Your new password is ') . $password;
                return System::getInstance()->mail($email, $title, $message);
            } else {
                return false;
            }
        }
    }