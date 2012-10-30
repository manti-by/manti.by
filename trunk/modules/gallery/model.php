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
    }