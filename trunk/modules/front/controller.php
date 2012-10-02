<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Front Controller class
      * @name $frontController 
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class FrontController extends Controller {

        public function indexAction($options) {
            // Test tags
            $tags = new Tag(array('foo', 'bar', 'lot', 'air'), array('name' => 'tags'));

            // Get frontpage contents items
            $options['title'] = 'Default Frontpage of M2 Micro Framework';
            $options['body']  = '<h1>Test page of M2 Micro Framework</h1>';
            $options['body'] .= $tags->render();

            return $options;
        }
    }
