<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Class for database operations (Uses MySQLi extention)
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
            // Get config
            $config = System::getInstance()->getConfig();

            // Already initialized?
            if (!empty($this->cid) && is_object($this->cid)) {
                return $this->cid;
            }

            // Parse config
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

            // Connect to DB
            $this->cid = mysqli_connect($this->db_path.':'.$this->db_port, $this->db_user, $this->db_pass);
            if (!$this->cid) {
                return $this->_throw($this->getError(), ERROR, $this->getLastErrorNum());
            }

            // Set encoding
            if (!empty($this->db_encoding)) {
                mysqli_query($this->cid, "SET NAMES '".$this->db_encoding."'");
            }

            // Select table
            if (!mysqli_select_db($this->cid, $this->db_base)) {
                return $this->_throw($this->getError(), ERROR, $this->getLastErrorNum());
            }

            return $this->cid;
        }

        /**
         * Close connection to DB
         * @return bool $state
         */
        public function close() {
            if (!mysqli_close($this->cid)) {
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
            $this->res = mysqli_query($this->cid, $this->query);

            if ($this->getLastErrorNum() > 0) {
                return $this->_throw($this->getError(), ERROR, $this->getLastErrorNum());
            } else {
                $this->result = mysqli_affected_rows($this->cid);
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
            // Check result
            if (!$this->checkResult()) {
                return false;
            }

            // Return first field
            $row = mysqli_fetch_row($this->res);
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
            // Check result
            if (!$this->checkResult()) {
                return false;
            }

            // Return object
            $obj = mysqli_fetch_object($this->res);
            if (!$obj || empty($obj)) return false;
            else return $obj;
        }

        /**
         * Get result objects array of query
         * @return array|bool $result resulted array of objects or false
         */
        public function getObjectsArray() {
            // Check result
            if (!$this->checkResult()) {
                return false;
            }

            // Return objects
            while($obj = mysqli_fetch_object($this->res)) {
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
            // Check result
            if (!$this->checkResult()) {
                return false;
            }

            // Return array
            while($row = mysqli_fetch_array($this->res, MYSQL_NUM)) {
                if (!$row || empty($row)) break;
                $arr[] = $row[0];
            }
            return $arr;
        }

        /**
         * Get array of named pairs
         * @param string $index - array index name
         * @param string $field - array field name
         * @return array|bool $result associative array of pairs ($index => $field) or false
         */
        public function getPairs($index, $field) {
            // Check result
            if (!$this->checkResult()) {
                return false;
            }

            // Return pairs
            while($obj = mysqli_fetch_object($this->res)) {
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
            return mysqli_errno($this->cid).': '.mysqli_error($this->cid);
        }

        /**
         * Get last error message
         * @return string $error last mysql error string
         */
        public function getLastErrorMsg() {
            return mysqli_error($this->cid);
        }

        /**
         * Get last error number
         * @return int $error_number last mysql error number
         */
        public function getLastErrorNum() {
            return (int)mysqli_errno($this->cid);
        }

        /**
         * Get last insert id
         * @return int $id
         */
        public function getLastInsertId() {
            return (int)mysqli_insert_id($this->cid);
        }

        /**
         * Escape string characters
         * @param string $string
         * @return string $result
         */
        public function escape($string) {
            return mysqli_real_escape_string($this->cid, $string);
        }
    }