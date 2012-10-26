<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Tag Controller class
     * @name $tagController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class TagController extends Controller {

        /**
         * Default Tag module action
         * @param array $options
         * @return array $result
         */
        public function indexAction($options) {
            return $this->searchAction($options);
        }

        /**
         * Search action
         * @param array $options
         * @return array $result
         */
        public function searchAction($options) {
            // Get tag ID or query
            $q = System::getInstance()->getCmd('q');
            $id = System::getInstance()->getCmd('id');
            
            // Get search results
            if ($q) {
                $options['title'] = T('Search results by tags: ') . $q;
                $options['data'] = Model::getModel('blog')->getPostsByTags($q);
            } elseif ($id) {
                $tag_name = $this->model->getTagNameById($id);
                $options['title'] = $tag_name ? T('Search results for tag #') . $tag_name : T('Search results');
                $options['data'] = Model::getModel('blog')->getPostsByTagId($id);
            } else {
                $options['title'] = T('No search results found');
                $options['data'] = Model::getModel('blog')->getPosts();
            }
            
            // Render search results
            $options['module'] = 'blog';
            $options['body'] = $this->view->renderItemsArray($options);

            return $this->view->wrapSidebar($options);
        }
    }
