<?php
    /**
      * Test cases for Database class
      * @package M2 Micro Framework
      * @subpackage Tests
      * @author Alexander Chaika
      */
    class DatabaseTest extends PHPUnit_Framework_TestCase {
        protected $database;
        
        public static function setUpBeforeClass() {
            // include libraries
            include '../trunk/bootstrap.php';
            
            // setup doc root for test files
            System::getInstance()->configAttr('doc_root', dirname(dirname(__FILE__)) . DIRECTORY_SEPARATOR . 'trunk');
        }
        
        public function setUp() {
            // setup database object
            $this->database = Database::getInstance();
        }
        
        public function testInsertQuery() {
            // insert recort into DB
            $query = "INSERT INTO `#__redirection` (`oldurl`, `newurl`) 
                      VALUES ('test_oldurl', 'test_newurl');";
            $result = $this->database->query($query);
            
            // check result
            $this->assertGreaterThanOrEqual(1, $result, $this->database->getError());
            return $this->database->getLastInsertId();
        }
        
        /**
          * @depends testInsertQuery
          */
        public function testUpdateQuery($insert_id) {
            // insert recort into DB
            $query = "UPDATE `#__redirection` 
                      SET `oldurl`= 'test_oldurl-updated', `newurl` = 'test_newurl-updated'
                      WHERE `id` = ".$insert_id.";";
            $result = $this->database->query($query);
            
            // check result
            $this->assertGreaterThanOrEqual(1, $result, $this->database->getError());
            return $insert_id;
        }
        
        /**
          * @depends testInsertQuery
          */
        public function testSelectValue($insert_id) {
            // insert recort into DB
            $query = "SELECT `oldurl`
                      FROM `#__redirection` 
                      WHERE `id` = ".$insert_id.";";
            $this->database->query($query);
            $result = $this->database->getField();
            
            // check result
            $this->assertEquals('test_oldurl-updated', $result, $this->database->getMessage());
        }
        
        /**
          * @depends testInsertQuery
          */
        public function testSelectObject($insert_id) {
            // insert recort into DB
            $query = "SELECT *
                      FROM `#__redirection` 
                      WHERE `id` = ".$insert_id.";";
            $this->database->query($query);
            $result = $this->database->getObject();
            
            // check result
            $this->assertInternalType('object', $result, $this->database->getError());
        }

        public function testSelectArray() {
            // insert recort into DB
            $query = "SELECT `oldurl`
                      FROM `#__redirection` 
                      LIMIT 0, 100;";
            $this->database->query($query);
            $result = $this->database->getArray();
            
            // check result
            $this->assertInternalType('array', $result, $this->database->getError());
            $this->assertGreaterThan(0, count($result), $this->database->getMessage());
        }
        
        public function testSelectObjectsArray() {
            // insert recort into DB
            $query = "SELECT *
                      FROM `#__redirection` 
                      LIMIT 0, 100;";
            $this->database->query($query);
            $result = $this->database->getObjectsArray();
            
            // check result
            $this->assertInternalType('array', $result, $this->database->getError());
            $this->assertInternalType('object', $result[0], 'NOT OBJECT???');
        }
        
        public function testSelectPairs() {
            // insert recort into DB
            $query = "SELECT *
                      FROM `#__redirection` 
                      LIMIT 0, 100;";
            $this->database->query($query);
            $result = $this->database->getPairs('id', 'oldurl');
            
            // check result
            $this->assertInternalType('array', $result, $this->database->getError());
        }
    }
