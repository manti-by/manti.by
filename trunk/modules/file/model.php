<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc File Model class
      * @name $fileModel
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class FileModel extends Model {

        private $_map = array();

        /**
         * Construct model and create file map
         */
        public function __construct() {
            // Construct parent class
            parent::__construct();

            // Create path mapping
            $this->_map = array(
                'preview'   => $this->config['preview_path'],
                'release'   => $this->config['release_path'],
                'cover'     => $this->config['cover_path']
            );
        }

        /**
         * Return file list by type
         * @param $type file type
         * @param int $limit (optional)
         * @return bool|array $result
         */
        public function getList($type, $limit = 0) {
            // Check map
            if (!array_key_exists($type, $this->_map)) {
                return $this->_throw(T('File type') . ' ' . $type . ' ' . T('not available'));
            }

            $this->database->query("CALL GET_FILES('$type', $limit);");
            if ($this->database->getResult() > 0) {
                return $this->database->getPairs('id', 'name');
            } else {
                return false;
            }
        }

        /**
         * Update DB file entries
         * @param $type file type
         * @return bool $result
         * @todo Update functionality
         */
        public function update($type) {
            return false;
        }
    }
