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
            $options['body'] = $this->view->getContents('blog', 'edit', $options['data']);
            
            return $options;
        }

        public function saveAction($options) {
            $options['output'] = 'json';
            $options['id'] = System::getInstance()->getCmd('id');

            $options['name'] = System::getInstance()->getCmd('name');
            if (empty($options['name'])) {
                $options['data'] = array('result' => 'error', 'error' => T('Post title could not be empty'));
                return $options;
            }

            $options['description'] = System::getInstance()->getCmd('description');
            if (empty($options['description'])) {
                $options['data'] = array('result' => 'error', 'error' => T('Post description could not be empty'));
                return $options;
            }

            $options['teaser']      = System::getInstance()->getCmd('teaser');
            if (empty($options['teaser'])) {
                $options['teaser'] = substr(strip_tags($options['description']), 0, Application::$config['teaser_length']);
            }

            $options['metakeys'] = System::getInstance()->getCmd('metakeys');

            $options['metadesc'] = System::getInstance()->getCmd('metadesc');
            if (empty($options['metadesc'])) {
                $options['metadesc'] = substr(strip_tags($options['description']), 0, Application::$config['metadesc_length']);
            }

            $options['is_music'] = System::getInstance()->getCmd('is_music', 0);

            if ($options['is_music']) {
                $options['preview'] = System::getInstance()->getCmd('preview');
                $options['release'] = System::getInstance()->getCmd('release');
                $options['covers'] = System::getInstance()->getCmd('covers');
                $options['relations'] = System::getInstance()->getCmd('relations');

                $options['catnum'] = System::getInstance()->getCmd('catnum');
                $options['genre'] = System::getInstance()->getCmd('genre');
                $options['quality'] = System::getInstance()->getCmd('quality');
                $options['length'] = System::getInstance()->getCmd('length');
                $options['file-size'] = System::getInstance()->getCmd('file-size');
                $options['tracklist'] = System::getInstance()->getCmd('tracklist');
            }

            // Save result
            if ($options['result'] = $this->model->savePost($options)) {
                $options['data'] = array('result' => 'success', 'id' => $options['result'], 'options' => $options);
            } else {
                $error =  $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }
            
            return $options;
        }
    }
