<?php
    /**
      * Test cases for Database class
      * @package M2 Micro Framework
      * @subpackage Tests
      * @author Alexander Chaika
      */
    class UserTest extends PHPUnit_Framework_TestCase {
        protected $user;
        protected $database;
        
        public static function setUpBeforeClass() {
            // include libraries
            include '../trunk/bootstrap.php';
            
            // setup doc root for test files
            System::getInstance()->configAttr('doc_root', dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . 'trunk');
        }
        
        public function setUp() {
            // start buffering for cookies & session
            ob_start();
            
            // setup database object
            $this->user = UserEntity::getInstance();
        }
        
        public function tearDown() {
            // send buffer with cookies & session
            ob_flush();
        }
        
        public function testCreateUser() {
            // insert recort into DB
            $data = array('email' => time().'@test.com', 'password' => 'password');
            $data['id'] = $this->user->create($data);
            
            // check result
            $stack = $this->user->getLastFromStack();
            $this->assertGreaterThan(0, $data['id'], $stack['message']);
            return $data;
        }
        
        /**
          * @depends testCreateUser
          */
        public function testCheckEmailTrue($data) {
            // get id
            $result = $this->user->checkEmail($data);
            
            // check result
            $this->assertEquals(true, $result, 'Email does not exist');
        }
        
        public function testCheckEmailFalse() {
            // get id
            $result = $this->user->checkEmail(array('email' => 'notexist@test.com'));
            
            // check result
            $this->assertEquals(false, $result, 'Email notexist@test.com is exist');
        }
        
        /**
          * @depends testCreateUser
          */
        public function testGetIdByLoginPass($data) {
            // get id
            $result = $this->user->getId($data);
            
            // check result
            $stack = $this->user->getLastFromStack();
            $this->assertEquals($data['id'], $result, $stack['message']);
        }
        
        /**
          * @depends testCreateUser
          */
        public function testGetIdByCookie($data) {
            // get id
            $config = System::getInstance()->getConfig();
            $cookie = md5($config['secret'].$data['email']);
            $result = $this->user->getId(array('cookie' => $cookie));
            
            // check result
            $stack = $this->user->getLastFromStack();
            $this->assertEquals($data['id'], $result, $stack['message']);
        }
        
        /**
          * @depends testCreateUser
          */
        public function testLoad($data) {
            // get user object
            $result = $this->user->load($data['id']);
            
            // check result
            $stack = $this->user->getLastFromStack();
            $this->assertInstanceOf('stdClass', $result, $stack['message']);
        }

        /**
          * @depends testCreateUser
          */
        public function testSetupSession($data) {
            // get user object
            $result = $this->user->setupSession($data['id'], false);
            
            // check result
            $stack = $this->user->getLastFromStack();
            $this->assertEquals($data['id'], $_SESSION['user_id'], $stack['message']);
        }
        
        /**
          * @depends testCreateUser
          */
        public function testSetupSessionWithCookie($data) {
            // get user object
            $result = $this->user->setupSession($data['id'], true);
            
            // check result
            $stack = $this->user->getLastFromStack();
            $this->assertEquals($data['id'], $_COOKIE['auth_token'], $stack['message']);
        }

        /**
          * @depends testSetupSession
          */
        public function testIsLogginedTrue() {
            // get user object
            $result = $this->user->isLoggined();
            
            // check result
            $this->assertEquals(true, $result, 'User not loggined');
        }
        
        /**
          * @depends testSetupSessionWithCookie
          */
        public function testClearSession() {
            // get user object
            $this->user->clearSession();
            
            // check result
            $this->assertEquals(0, $_SESSION['user_id'], 'Session not cleared');
            $this->assertEquals(false, isset($_COOKIE['auth_token']), 'Cookie not cleared');
        }
        
        /**
          * @depends testClearSession
          */
        public function testIsLogginedFalse() {
            // get user object
            $result = $this->user->isLoggined();
            
            // check result
            $this->assertEquals(false, $result, 'User still loggined');
        }
    }
