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
            $options['title'] = 'File list';
            $options['data'] = $this->model->getList();
            $options['body']  = $this->view->getContents('file', 'list', $options);

            return $options;
        }

        public function addAction($options) {
            // Set params
            $options['output'] = 'json';
            $options['source'] = System::getInstance()->getCmd('source');
            $options['name'] = System::getInstance()->getCmd('name');
            $options['description'] = System::getInstance()->getCmd('description');

            if ($id = $this->model->add($options)) {
                $options['data'] = array('result' => 'success', 'id' => $id);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        public function removeAction($options) {
            // Set params
            $options['output'] = 'json';

            if ($source = $this->model->remove(System::getInstance()->getCmd('id'))) {
                $options['data'] = array('result' => 'success', 'source' => $source);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        public function deleteAction($options) {
            // Set params
            $options['output'] = 'json';

            if ($this->model->delete(System::getInstance()->getCmd('source'))) {
                $options['data'] = array('result' => 'success');
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }
    }
