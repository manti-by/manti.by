<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Blog View Class
      * @name $blogView 
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class BlogView extends View {
        public function renderCategoryItems($options) {
            // if no items
            if (empty($options['data']) || count($options['data']) == 0) {
                $options['data'] = T('No posts found');
                return $this->view->getContents('blog', 'category', $options);
            }
            
            // render each item
            $items_html = array();
            foreach($items as $item) {
                $items_html[] = $this->view->getContents('blog', 'item', $options['data']);
            }
            
            // render category
            $options['data'] = $items_html;
            return $this->view->getContents('blog', 'category', $options);
        }
    }
