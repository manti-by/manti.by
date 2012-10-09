<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog Controller class
     * @name $blogController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class BlogController extends Controller {

        public function indexAction($options) {
            return $this->listAction($options);
        }

        public function listAction($options) {
            // Get category ID
            $tags = System::getInstance()->getCmd('id');
            
            // Get category title
            if ($tags) {
                $options['data'] = $this->model->getPostsByTags($tags);
                $options['title'] = 'Search by tags: ' . implode(', ', $tags);
            } else {
                $options['data'] = $this->model->getPosts();
                $options['title'] = Application::$config['site_title'];
            }
            
            // get category items and render it
            $options['module'] = 'blog';
            $options['body'] = $this->view->renderItemsArray($options);
            
            return $options;
        }

        public function showAction($options) {
            // Get item ID
            $post_id = System::getInstance()->getCmd('id');
            
            // Get item title and data
            if ($post_id) {
                $options['data'] = $this->model->getPost($post_id);
                $options['title'] = $options['data']->name;
            } else {
                return $this->view->_404($options);
            }
            
            // Render blog item
            $options['body'] = $this->view->getContents('blog', 'item', $options);
            
            return $options;
        }

        public function editAction($options) {
            // Get item ID
            $options['id'] = System::getInstance()->getCmd('id');
            
            // Get item title
            if ($options['id']) {
                $options['data'] = $this->model->getPost($options['id']);
            } else {
                $options['data'] = null;
            }
            
            // Render edit form
            $options['title'] = 'Edit post';
            $options['body'] = $this->view->getContents('blog', 'edit', $options);
            
            return $options;
        }

        public function saveAction($options) {
            // Get post ID
            $options['id'] = System::getInstance()->getCmd('id', null);
            
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
