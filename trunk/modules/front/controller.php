<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Front Controller class
     * @name $frontController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class FrontController extends Controller {

        public function indexAction($options) {
            // Get frontpage contents items
            $options['title'] = 'Default Frontpage of M2 Micro Framework';
            $options['body']  = '<h1>Front page of M2 Micro Framework</h1>';

            return $options;
        }
    }
