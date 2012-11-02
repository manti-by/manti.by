<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Default model class
     * @name $model
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class Model extends Application {
        protected $cid;
        protected $database;
        protected $user;

        protected static $models = array();

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

        /**
         * Default getModel method
         * @param string $name
         * @return Model|BlogModel|FileModel|FrontModel|GalleryModel|TagModel|UserModel $model
         */
        public static function getModel($name = null) {
            // Check existing object pool
            if (!(isset(self::$models[$name]) && is_object(self::$models[$name]))) {
                $model_name = (string)ucfirst($name) . 'Model';
                self::$models[$name] = new $model_name();
            }
            return self::$models[$name];
        }
    }