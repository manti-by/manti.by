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
                FileEntity::TYPE_PREVIEW   => realpath(Application::$config['preview_path']),
                FileEntity::TYPE_RELEASE   => realpath(Application::$config['release_path']),
                FileEntity::TYPE_COVERS    => realpath(Application::$config['covers_path'])
            );
        }

        /**
         * Get approved (in DB) filelist
         * @param string $type OPTIONAL file type
         * @param int $limit OPTIONAL
         * @return array|bool $result
         */
        public function getApproved($type = null, $limit = 100) {
            // Check map
            $type = $this->checkMap($type);

            // Get files from DB
            $this->database->query("CALL GET_FILES('$type', $limit);");
            return $this->database->getPairs('id', 'source');
        }

        /**
         * Get file list
         * @param string $type OPTIONAL file type
         * @param int $limit OPTIONAL
         * @return array|bool $result
         */
        public function getList($type = null, $limit = 100) {
            // Check map
            $type = $this->checkMap($type);

            // Get files from DB
            $db_files = array();
            $this->database->query("CALL GET_FILES('$type', $limit);");
            if ($this->database->checkResult()) {
                $db_files = $this->database->getPairs('id', 'source');
            }

            // Scan filesystem
            clearstatcache();
            if ($type == null) {
                $result = array();
                foreach ($this->_map as $type => $path) {
                    $data = $this->getDirList($path);

                    // Check in DB
                    if (count($db_files)) {
                        foreach ($db_files as $id => $source) {
                            if (array_key_exists($source, $data)) {
                                $data[$source]['id'] = $id;
                            }
                        }
                    }

                    // Compile result
                    $result[$type] = array(
                        'data' => $data,
                        'path' => $path
                    );
                }
            } else {
                $result = $this->getDirList($this->_map[$type]);
            }

            return $result;
        }

        /**
         * Get download file list
         * @param string $type OPTIONAL file type, default FileEntity::TYPE_RELEASE
         * @param int $limit OPTIONAL
         * @return array|bool $result
         */
        public function getDownloadList($type = FileEntity::TYPE_RELEASE, $limit = 100) {
            // Check map
            $type = $this->checkMap($type);

            // Get files from DB
            $this->database->query("CALL GET_FILES('$type', $limit);");
            return $this->database->getObjectsArray();
        }

        /**
         * Add file to DB
         * @param array $options
         * @return int|bool $insert_id
         */
        public function add($options) {
            if (file_exists(ROOT_PATH . DS . $options['source'])) {
                // Get type - parent file folder
                $pathinfo = pathinfo(ROOT_PATH . DS . $options['source']);
                $type = isset($options['type']) && !empty($options['type']) ? $options['type'] : end(explode(DS, realpath($pathinfo['dirname'])));

                // Get file info
                $file_source = fopen(ROOT_PATH . DS . $options['source'], "r");
                $fstat = fstat($file_source);

                // Convert to unix routes
                $source = str_replace(DS , '/', $options['source']);
                $source = str_replace('//' , '/', $source);

                // Create or update file
                $this->database->query("CALL UPSERT_FILE('".$type."', '".$options['name']."','".$options['description']."','".$source."',".$fstat['size'].",'".md5_file($options['source'])."');");
                return $this->database->getField();
            } else {
                return $this->_throw(T('File does not exist'), ERROR);
            }
        }

        /**
         * Remove file from DB
         * @param int $id
         * @return bool $result
         */
        public function remove($id) {
            // Create or update file
            $this->database->query("CALL REMOVE_FILE('".$id."');");
            if ($this->database->checkResult()) {
                return $this->database->getField();
            } else {
                return $this->_throw(T('File does not exist'));
            }
        }

        /**
         * Remove file from DB
         * @param string $source
         * @return bool $result
         */
        public function delete($source) {
            // Remove file from DB
            $this->database->query("CALL REMOVE_FILE('".$source."');");

            // Remove file from FS
            $file = ROOT_PATH . DS . $source;
            if (file_exists($file)) {
                if (unlink($file)) {
                    return true;
                } else {
                    return $this->_throw(T('You dont have permissions to delete this file'));
                }
            } else {
                return $this->_throw(T('File does not exist'), ERROR);
            }
        }

        /**
         * Recursive read directory and return array of allowed files
         * @param string $directory
         * @param bool $allow_dir_list
         * @return array|bool $result
         */
        public function getDirList($directory, $allow_dir_list = false) {
            try {
                $result = array();
                $iterator = new RecursiveDirectoryIterator($directory);
                foreach ($iterator as $path) {
                    // Remove pointers to current and previous
                    // directories in unix systems
                    if (substr($path, -1) != '.') {
                        // Remove root path from file link
                        /** @noinspection PhpUndefinedMethodInspection */
                        $current = str_ireplace(ROOT_PATH, '.', $path->__toString());
                        $pathinfo = pathinfo($current);

                        // Check available extension
                        if ((isset($pathinfo['extension']) && in_array(strtolower($pathinfo['extension']), explode(',', Application::$config['allowed_file_extensions']))) || $allow_dir_list) {
                            // Convert to unix routes
                            $source = str_replace(DS , '/', $current);
                            $source = str_replace('//' , '/', $source);

                            // Add file info
                            if (!$allow_dir_list) {
                                $file = fopen($current, "r");
                                $result[$source] = $pathinfo + fstat($file);
                            } else {
                                $result[$source] = $pathinfo;
                            }
                        }
                    }
                }
                return $result;
            } catch (Exception $e) {
                return $this->_throw(T('Error while trying read directory') . ' "' . $directory . '" : ' . $e->getMessage(), ERROR);
            }
        }

        /**
         * Check available files map
         * @param $type
         * @return string|null $type
         */
        private function checkMap($type) {
            if (!array_key_exists($type, $this->_map) && $type != null) {
                $this->_throw(T('File type') . ' "' . $type . '" ' . T('not available, return all pathes'));
                $type = null;
            }
            return $type;
        }

        /**
         * Track file by id
         * @param int $id
         * @return bool|object $result
         */
        public function trackFileById($id){
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('File ID could not be empty'));
            }

            $this->database->query("CALL TRACK_FILE_BY_ID($id);");
            return $this->database->getField();
        }
    }
