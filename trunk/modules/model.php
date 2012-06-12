<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Default model class
      * @name $model
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class Model extends Application {
        protected $cid;
        protected $database;

        /**
          * Model class constructor with DB init
          */
        public function __construct() {
            // get database object
            $this->database = Database::getInstance();

            // setup DB connection
            if (empty($this->cid)) {
                $this->cid = $this->database->connect();
            }
        }
    }
