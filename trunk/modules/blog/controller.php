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

        /**
         * @var BlogModel $model
         */
        public $model;

        /**
         * @var BlogView $view
         */
        public $view;

        /**
         * Default action
         * @param array $options
         * @return array $options
         */
        public function indexAction($options) {
            return $this->listAction($options);
        }

        /**
         * List blog posts with tags
         * @param array $options
         * @return array $options
         */
        public function listAction($options) {
            // Get filter tags and display page
            $options['tags'] = System::getInstance()->getCmd('tags');
            $options['page'] = System::getInstance()->getCmd('page', 1);

            // Get posts
            if ($options['tags']) {
                $options['data'] = $this->model->getPostsByTags($options['tags']);
                $options['title'] = T('Search by tags') . ': ' . $options['tags'];
            } else {
                $options['data'] = $this->model->getPosts(Application::$config['posts_per_page'], $options['page']);
                $options['title'] = Application::$config['site_title_' . Application::$config['language']];
            }
            
            // Get items and render it
            if (!empty($options['data'])) {
                $options['module'] = 'blog';
                $options['body'] = $this->view->renderItemsArray($options);

                // Add ajax loader
                $options['body'] .= $this->view->getContents('blog', 'ajax-load', $options);

                return $this->view->wrapSidebar($options);
            } else {
                return $this->view->_404($options);
            }
        }

        /**
         * List blog posts with tags
         * @param array $options
         * @return array $options
         * @todo Test it with 10-20 posts
         */
        public function nextAction($options) {
            // Get page and its contents
            $options['page'] = System::getInstance()->getCmd('page', 1);
            $options['data'] = $this->model->getPosts(Application::$config['posts_per_page'], $options['page']);

            // Get items and render it
            if ($options['data']) {
                $options['output'] = View::OUTPUT_TYPE_HTML;
                $options['module'] = 'blog';
                $options['body']   = $this->view->renderItemsArray($options);
            } else {
                $options['output'] = View::OUTPUT_TYPE_RAW;
                $options['data'] = null;
            }

            return $options;
        }

        /**
         * Show blog post by id
         * @param array $options
         * @return array|bool $options
         */
        public function showAction($options) {
            // Get item ID
            $options['id'] = System::getInstance()->getCmd('id');
            
            // Get item title and data
            if ($options['id']) {
                $options['data'] = $this->model->getPost($options['id']);
                $options['title'] = $options['data']->name;
            } else {
                return $this->view->_404($options);
            }
            
            // Render blog item
            if (!empty($options['data'])) {
                $options['body'] = $this->view->getContents('blog', 'item-full', $options);

                return $this->view->wrapSidebar($options);
            } else {
                return $this->view->_404($options);
            }
        }

        /**
         * Edit|Create blog post form
         * @param array $options
         * @return array|bool $options
         */
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
            if (!empty($options['data'])) {
                $options['title'] = T('Edit post');
                $options['body'] = $this->view->getContents('blog', 'edit', $options);

                return $options;
            } else {
                $options['title'] = T('Add new post');
                $options['body'] = $this->view->getContents('blog', 'edit');

                return $options;
            }
        }

        /**
         * Save blog post to DB
         * @param array $options
         * @return array|bool $options
         */
        public function saveAction($options) {
            $system = System::getInstance();

            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = $system->getCmd('id', 0);

            $options['name'] = $system->getCmd('name', '');
            if (empty($options['name'])) {
                $options['data'] = array('result' => 'error', 'error' => T('Post title could not be empty'));
                return $options;
            }

            // #43634275 - Prevent flip for teaser and description
            $options['teaser'] = $system->getCmd('teaser', '');

            $options['description'] = $system->getCmd('description', '');
            if (empty($options['description'])) {
                $options['data'] = array('result' => 'error', 'error' => T('Post description could not be empty'));
                return $options;
            }

            if (empty($options['teaser'])) {
                $options['teaser'] = substr(strip_tags($options['description']), 0, Application::$config['teaser_length']);
            }

            $options['metakeys'] = $system->getCmd('metakeys', '');

            $options['metadesc'] = $system->getCmd('metadesc', '');
            if (empty($options['metadesc'])) {
                $options['metadesc'] = substr(strip_tags($options['description']), 0, Application::$config['metadesc_length']);
            }

            $options['is_music'] = $system->getCmd('is_music', 0);

            if ($options['is_music']) {
                $options['preview'] = $system->getCmd('preview', '');
                $options['release'] = $system->getCmd('release', '');
                $options['covers'] = $system->getCmd('covers', '');
                $options['relations'] = $system->getCmd('relations', '');

                $options['catnum'] = $system->getCmd('catnum', '');
                $options['genre'] = $system->getCmd('genre', '');
                $options['quality'] = $system->getCmd('quality', '');
                $options['length'] = $system->getCmd('length', '');
                $options['tracklist'] = $system->getCmd('tracklist', '');
            }

            // Save result
            $options['result'] = $this->model->savePost($options);
            if (!empty($options['result'])) {
                $options['data'] = array('result' => 'success', 'id' => $options['result'], 'options' => $options);
            } else {
                $error =  $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }
            
            return $options;
        }
    }
