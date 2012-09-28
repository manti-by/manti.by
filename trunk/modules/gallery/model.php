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
            $this->file_path = realpath(ROOT_PATH . $this->config['gallery_path']);
            $this->link_path = $this->config['http_host'] . $this->config['gallery_path'];
        }

        private function getGalleriesList() { }
    }