<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Tag Controller class
      * @name $tagController
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class TagController extends Controller {

        public function indexAction($options) {
            return $this->searchAction($options);
        }

        public function searchAction($options) {
            // Get category ID
            $tags = $this->system->getCmd('tags');
            
            // Get category title
            if ($tags) {
                $options['title'] = 'Search by tags: ' . $tags;
                $options['data'] = $this->model->getPostsByTags(explode(',', $tags));
            } else {
                $options['title'] = T('No search results found');
                $options['data'] = $this->model->getPosts();
            }
            
            // get category items and render it
            $options['module'] = 'blog';
            $options['body'] = $this->view->renderItemsArray($options);
            
            return $options;
        }
    }
