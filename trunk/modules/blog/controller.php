<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Blog Controller class
      * @name $frontController 
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class BlogController extends Controller {

        public function dispatch() {
            // get action
            $options['action'] = $this->system->getCmd('action'); 
            
            // route action
            $method = $options['action'].'Action';
            if (is_callable(array($this, $method))) {
                return $this->$method($options);
            } else {
                return $this->categoryAction($options);
            }
        }

        private function categoryAction($options) {
            // get category ID
            $category_id = $this->system->getCmd('id', null);
            
            // get category title
            if ($category_id) {
                $category = $this->model->getCategory($category_id);
                $options['title'] = $category->name;
            } else {
                $config = $this->system->getConfig();
                $options['title'] = $config['site_title'] . ' Blog Pages';
            }
            
            // get category items and render it
            $options['data'] = $this->model->getCategoryItems($category_id);
            $options['body'] = $this->view->renderCategoryItems($options);
            
            return $options;
        }
    }
