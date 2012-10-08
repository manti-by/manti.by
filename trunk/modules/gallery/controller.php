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
            return $this->listAction($options);
        }

        public function listAction($options) {
            // Get category ID
            $tags = System::getInstance()->getCmd('id');

            // Get category title
            if ($tags) {
                $options['data'] = $this->model->getGalleryByTags($tags);
                $options['title'] = 'Search by tags: ' . implode(', ', $tags);
            } else {
                $options['data'] = $this->model->getGallery();
                $options['title'] = Application::$config['site_title'];
            }

            // get category items and render it
            $options['module'] = 'gallery';
            $options['body'] = $this->view->renderItemsArray($options);

            return $options;
        }
    }
