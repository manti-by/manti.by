<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Class for database operations
      * NOTICE: This class implemented as Singleton
      * @name $database
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      */
    class Database extends Application {
        private $cid;
        private $res;

        private $db_path;
        private $db_port;
        private $db_user;
        private $db_pass;
        private $db_base;
        private $db_prefix;

        private $query;
        
        protected static $instance = null;

        /**
          * Singleton protection
          */
        private function __construct() {
            // Try connect to DB
            $this->connect();
        }
        private function __clone() {}
        private function __wakeup() {}
    
        /**
          * GetInstance class method
          * @return object $instance
          */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new Database;
            }
            return self::$instance;
        }
        
        /**
          * Connect to DB and select TABLE
          * @return bool $state
          */
        public function connect() {
            // get config
            $config = System::getInstance()->getConfig();
            
            // already initialized?
            if (!empty($this->cid) && is_resource($this->cid)) {
                return $this->cid;
            }
            
            // parse config
            if (!empty($config)) {
                $this->db_path = $config['db_path'];
                $this->db_port = $config['db_port'];
                $this->db_user = $config['db_user'];
                $this->db_pass = $config['db_pass'];
                $this->db_base = $config['db_base'];
                $this->db_prefix = $config['db_prefix'];
                $this->db_encoding = $config['db_encoding'];
            } else {
                return $this->_throw(T('Invalid config'), ERROR);
            }

            // connect to DB
            $this->cid = mysql_pconnect($this->db_path.':'.$this->db_port, $this->db_user, $this->db_pass);
            if (!$this->cid) {
                return $this->_throw($this->getError(), ERROR, $this->getLastErrorNum());
            }
            
            // set encoding
            if (!empty($this->db_encoding)) {
                mysql_query("SET NAMES '".$this->db_encoding."'");
            }

            // select table
            if (!mysql_select_db($this->db_base, $this->cid)) {
                return $this->_throw($this->getError(), ERROR, $this->getLastErrorNum());
            }

            return $this->cid;
        }

        /**
          * Close connection to DB
          * @return bool $state
          */
        public function close() {
            if (!mysql_close($this->cid)) {
                return $this->_throw($this->getError());
            } else {
                return $this->_clean();
            }
        }

        /**
          * Replace #__ to db prefix
          * @param string $query query to execute
          * @return string $query with replaced prefix
          */
        private function replacePrefix($query) {
            return str_replace('#__', $this->db_prefix, $query);
        }

        /**
          * Set and execute query
          * if success return number of affected rows or false
          * !write the names of all tables without the prefix, but like #__
          * @param string $query query to execute
          * @return int $state count of affected rows
          */
        public function query($query) {
            $this->query = $this->replacePrefix($query);
            $this->res = mysql_query($this->query, $this->cid);

            if ($this->getLastErrorNum() > 0) {
                return $this->_throw($this->getError(), ERROR, $this->getLastErrorNum());
            } else {
                $this->result = mysql_affected_rows($this->cid);
                return $this->result;
            }
        }

        /**
          * Execute last query
          * @return bool $state
          */
        public function exec() {
            if (!empty($this->query)) {
                return $this->query($this->query);
            } else {
                return $this->_throw(T('DB empty query'));
            }
        }

        /**
          * Set query
          * @param string $query optional query to execute
          * @return bool $state
          */
        public function setQuery($query = null) {
            if (!empty($query)) {
                $this->query = $query;
                return $this->_clean();
            } else {
                return $this->_throw(T('DB empty query'));
            }
        }

        /**
          * Get last query
          * @return string|bool $query or false
          */
        public function getQuery() {
            if (!empty($this->query)) {
                return $this->query;
            } else {
                return $this->_throw(T('DB empty query'));
            }
        }

        /**
          * Print last query
          */
        public function printQuery() {
            $query = $this->getQuery();
            $query = (empty($query) ? T('No queries executed') : $this->replacePrefix($query));
            echo '<pre>' . $query . '</pre>';
        }

        /**
          * Get first field value of result
          * @return string|bool $result
          */
        public function getField() {
            // check result
            if (!$this->checkResult()) {
                return false;
            }

            // return first field
            $row = mysql_fetch_row($this->res);
            if (!$row || empty($row)) {
                return false;
            } else {
                return $row[0];
            }
        }

        /**
          * Get first resulting object of query
          * @return object|bool $result resulted object or false
          */
        public function getObject() {
            // check result
            if (!$this->checkResult()) {
                return false;
            }

            // return object
            $obj = mysql_fetch_object($this->res);
            if (!$obj || empty($obj)) return false;
            else return $obj;
        }

        /**
          * Get result objects array of query
          * @return array|bool $result resulted array of objects or false
          */
        public function getObjectsArray() {
            // check result
            if (!$this->checkResult()) {
                return false;
            }

            // return objects
            while($obj = mysql_fetch_object($this->res)) {
                if (!$obj || empty($obj)) break;
                $arr[] = $obj;
            }
            return $arr;
        }

        /**
          * Get result array of query
          * @return array|bool $result resulted array of rows (arrays too) or false
          */
        public function getArray() {
            // check result
            if (!$this->checkResult()) {
                return false;
            }

            // return array
            while($row = mysql_fetch_array($this->res, MYSQL_NUM)) {
                if (!$row || empty($row)) break;
                $arr[] = $row[0];
            }
            return $arr;
        }

        /**
          * Get array of named pairs
          * @return array|bool $result associative array of pairs (id => $field) or false
          */
        public function getPairs($index, $field) {
            // check result
            if (!$this->checkResult()) {
                return false;
            }

            // return pairs
            while($obj = mysql_fetch_object($this->res)) {
                if (!$obj || empty($obj)) break;
                if (empty($obj->$index)) {
                    return $this->_throw(T('DB incorect index'));
                }
                $arr[(int)$obj->$index] = $obj->$field;
            }
            return $arr;
        }

        /**
          * Check last operation result
          * @return bool $result
          */
        private function checkResult() {
            if ($this->result < 1 && $this->getLastErrorNum() != 0) {
                return $this->_throw($this->getError(), ERROR, -1);
            } elseif ($this->result < 1 && $this->getLastErrorNum() == 0) {
                return $this->_throw(T('Empty result'), NOTICE);
            } else {
                return true;
            }
        }

        /**
          * Get last error string with error number
          * @return string $error last mysql error string and number
          */
        public function getError() {
            return mysql_errno($this->cid).': '.mysql_error($this->cid);
        }

        /**
          * Get last error message
          * @return string $error last mysql error string
          */
        public function getLastErrorMsg() {
            return mysql_error($this->cid);
        }

        /**
          * Get last error number
          * @return int $error_number last mysql error number
          */
        public function getLastErrorNum() {
            return (int)mysql_errno($this->cid);
        }

        /**
          * Get last insert id
          * @return int $id
          */
        public function getLastInsertId() {
            return (int)mysql_insert_id($this->cid);
        }
        
        /**
          * Escape string characters
          * @param string $string 
          * @return string $result
          */
        public function escape($string) {
            return mysql_real_escape_string($string);
        }
        
        public function escapeFunctionName() {
            return 'mysql_real_escape_string';
        }
    }
