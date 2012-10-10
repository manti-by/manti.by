<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * File Model class
     * @name $fileModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC2
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
                'preview'   => realpath(Application::$config['preview_path']),
                'release'   => realpath(Application::$config['release_path']),
                'cover'     => realpath(Application::$config['covers_path'])
            );
        }

        /**
         * Return file list from DB by type
         * @param string $type OPTIONAL file type
         * @param int $limit OPTIONAL
         * @return bool|array $result
         */
        public function getDBList($type = null, $limit = 0) {
            // Check map
            if (!array_key_exists($type, $this->_map) && $type !== null) {
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
         * Get filelist from local system
         * @param string $type OPTIONAL file type
         * @return array|bool $result
         */
        public function getFSList($type = null) {
            // Check map
            if (!array_key_exists($type, $this->_map) && $type != null) {
                $this->_throw(T('File type') . ' "' . $type . '" ' . T('not available, scan all pathes'));
                $type = null;
            }

            // Scan filesystem
            clearstatcache();
            if ($type == null) {
                $result = array();
                foreach ($this->_map as $type => $path) {
                    $result[$type] = array(
                        'data' => $this->getDirList($path),
                        'path' => $path
                    );
                }
            } else {
                $result = $this->getDirList($this->_map[$type]);
            }

            return $result;
        }

        /**
         * Recursive read directory and return array of allowed files
         * @param string $directory
         * @return array|bool $result
         */
        private function getDirList($directory) {
            $result = array();
            $iterator = new RecursiveDirectoryIterator($directory);
            foreach ($iterator as $path) {
                $current = $path->__toString();
                $pathinfo = pathinfo($current);

                // Check available extension
                if (in_array($pathinfo['extension'], explode(',', Application::$config['allowed_file_extensions']))) {
                    $file = fopen($current, "r");
                    $result[$current] = $pathinfo + fstat($file);
                }
            }

            return $result;
        }
    }
