<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Gallery Model class
      * @name $galleryModel
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class GalleryModel extends Model {

        private $file_path;
        private $link_path;

        public function __construct() {
            parent::__construct();

            $this->file_path = realpath(ROOT_PATH . Application::$config['gallery_path']);
            $this->link_path = Application::$config['http_host'] . Application::$config['gallery_path'];
        }

        public function getGalleryByTags($tags, $limit = 0) {
            if (empty($tags)) {
                return $this->getGalleryList();
            }

            $tags = implode(',', $tags);
            $this->database->query("CALL GET_GALLERY_BY_TAGS('$tags', $limit)");
            if ($this->database->getResult() > 0) {
                return $this->database->getObjectsArray();
            } else {
                return false;
            }
        }

        public function getGallery($limit = 10) {
            $this->database->query("CALL GET_GALLERY($limit)");
            if ($this->database->getResult() > 0) {
                return $this->database->getObjectsArray();
            } else {
                return false;
            }
        }
    }