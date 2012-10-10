<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * File Controller class
     * @name $fileController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC2
     * @todo Implement file adding
     */
    class FileController extends Controller {

        public function indexAction($options) {
            return $this->listAction($options);
        }

        public function listAction($options) {
            // Get all files list
            $options['title'] = 'File list from DB';
            $options['data'] = $this->model->getDBList();
            $options['body']  = $this->view->getContents('file', 'dblist', $options);

            return $options;
        }

        public function filesystemAction($options) {
            // Get all files list
            $options['title'] = 'File list from FS';
            $options['data'] = $this->model->getFSList();
            $options['body']  = $this->view->getContents('file', 'fslist', $options);

            return $options;
        }

        public function addAction($options) {
            $options['output'] = 'json';
            $options['data'] = array('result' => 'success');
            return $options;
        }
    }
