<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Gallery Controller class
      * @name $galleryController
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class GalleryController extends Controller {

        public function indexAction($options) {
            // Get frontpage contents items
            $options['title'] = 'Gallery of M2 Micro Framework';
            $options['body'] = '<h1>Gallery of M2 Micro Framework</h1>';
            return $options;
        }
    }
