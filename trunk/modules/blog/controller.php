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
                return $this->listAction($options);
            }
        }

        private function listAction($options) {
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
            $options['entity'] = 'blog';
            $options['data'] = $this->model->getCategoryItems($category_id);
            $options['body'] = $this->view->renderItemsArray($options);
            
            return $options;
        }

        private function showAction($options) {
            // get category ID
            $post_id = $this->system->getCmd('id', null);
            
            // get category title
            if ($post_id) {
                $options['data'] = $this->model->getPost($category_id);
                $options['title'] = $options['data']->name;
            } else {
                return $this->_404($options);
            }
            
            // get category items and render it
            $options['entity'] = 'blog';
            $options['data'] = $this->model->getCategoryItems($category_id);
            $options['body'] = $this->view->renderItemsArray($options);
            
            return $options;
        }

        private function editAction($options) {
            // get category ID
            $options['id'] = $this->system->getCmd('id', null);
            
            // get category title
            if ($options['id']) {
                $options['data'] = $this->model->getPost($options['id']);
            } else {
                $options['data'] = null;
            }
            
            // get category items and render it
            $options['title'] = 'Edit post';
            $options['body'] = $this->view->getContents('form', 'edit_post', $options);
            
            return $options;
        }
        
        private function saveAction($options) {
            // get post ID
            $options['id'] = $this->system->getCmd('id', null);
            
            // Update or create new
            if ($options['id']) {
                $options['result'] = $this->model->updatePost($options);
            } else {
                $options['result'] = $this->model->createPost($options);
            }
            
            // Send result
            if ($options['result']) {
                $options['title'] = 'Save post';
                $options['body'] = $this->view->getContents('form', 'edit_post', $options);
            }
            
            return $options;
        }
    }
