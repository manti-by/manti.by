<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery Model class
     * @name $galleryModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.2RC1
     */
    class GalleryModel extends Model {

        /**
         * @var string $file_path
         */
        private $file_path;

        /**
         * @var string $link_path
         */
        private $link_path;

        /**
         * File model constructor
         */
        public function __construct() {
            parent::__construct();

            $this->file_path = realpath(ROOT_PATH . Application::$config['gallery_path']);
            $this->link_path = Application::$config['http_host'] . Application::$config['gallery_path'];
        }

        /**
         * Return gallery array by tags
         * @param array $tags
         * @param int $limit
         * @return array|bool
         */
        public function getGalleryByTags($tags, $limit = 0) {
            if (empty($tags)) {
                return $this->getGallery();
            }

            $tags = implode(',', $tags);
            $this->database->query("CALL GET_GALLERY_BY_TAGS('$tags', $limit)");
            return $this->database->getObjectsArray();
        }

        /**
         * Get gallery list
         * @param int $limit
         * @return array|bool
         */
        public function getGallery($limit = 10) {
            $this->database->query("CALL GET_GALLERY($limit)");
            return $this->database->getObjectsArray();
        }

        /**
         * Update gallery entrues from FS to DB
         * @return array list of all new images from gallery path
         */
        public function updateFSlist() {
            $file_list = array();

            // Get all gallery images
            clearstatcache();
            $fileModel = Model::getModel('file');
            $galleries = $fileModel->getDirList($this->file_path . DS . 'originals', true);
            foreach ($galleries as $path => $data) {
                foreach ($fileModel->getDirList($path) as $filename => $fileinfo) {
                    $file_list[$filename] = 'Readed from FS';
                }
            }

            // Check DB
            $this->database->query("CALL GET_FILES('gallery', 0);");
            if ($this->database->checkResult()) {
                $db_files = $this->database->getPairs('id', 'source');
            }

            // Check in DB
            if (count($file_list)) {
                foreach ($file_list as $source => $status) {
                    if (in_array($source, $db_files)) {
                        unset($file_list[$source]);
                    } else {
                        if ($fileModel->add(array('source'=> $source, 'type'  => 'gallery',))) {
                            $file_list[$source] = 'Stored in DB';
                        } else {
                            $message = $this->getLastFromStack();
                            $file_list[$source] = $message['message'];
                        }
                    }
                }
            }

            return $file_list;
        }

        public function rebuildThumbnails() {
            $resized = array();

            // Get all registered images
            $this->database->query("CALL GET_FILES('gallery', 0);");
            if ($this->database->checkResult()) {
                $db_files = $this->database->getPairs('id', 'source');
            }

            // Rebuild thumbnails
            foreach($db_files as $id => $source) {
                // Generate thumbnail pathes
                $pathinfo = pathinfo($source);
                $thumbpath = $this->file_path . DS . 'thumbnails' . strrchr($pathinfo['dirname'], '/');
                $thumbname = $thumbpath . DS . $pathinfo['basename'];

                // Check directory path and try to create it
                if (!file_exists($thumbpath)) {
                    if (!mkdir($thumbpath)) {
                        $this->_throw(T('Could not create thumbnail directory'));
                        continue;
                    }
                }

                // Check thumbnail and try to create it
                if (!file_exists($thumbname)) {
                    if (System::getInstance()->resize($source, $thumbname, Application::$config['thumb_width'], Application::$config['thumb_height'])) {
                        $resized[] = $thumbpath;
                    }
                }
            }

            return $resized;
        }
    }