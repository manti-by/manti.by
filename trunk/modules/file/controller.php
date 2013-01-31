<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * File Controller class
     * @name $fileController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class FileController extends Controller {

        /**
         * Default File module action
         * @param array $options
         * @return array $result
         */
        public function indexAction($options) {
            return $this->listAction($options);
        }

        /**
         * Show files list for downloading
         * @param array $options
         * @return array $result
         */
        public function listAction($options) {
            // Get all files list
            $options['title'] = T('Download file list');
            $options['data'] = $this->model->getDownloadList();
            $options['body']  = $this->view->getContents('file', 'list', $options);

            return $options;
        }

        /**
         * Edit files list
         * @param array $options
         * @return array $result
         */
        public function editAction($options) {
            // Get all files list
            $options['title'] = T('Edit file list');
            $options['data'] = $this->model->getList();
            $options['body']  = $this->view->getContents('file', 'edit', $options);

            return $options;
        }

        /**
         * Add file to DB action
         * @param array $options
         * @return array $result
         */
        public function addAction($options) {
            // Set params
            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['source'] = System::getInstance()->getCmd('source');
            $options['name'] = System::getInstance()->getCmd('name');
            $options['description'] = System::getInstance()->getCmd('description');

            $id = $this->model->add($options);
            if ($id > 0) {
                $options['data'] = array('result' => 'success', 'id' => $id);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        /**
         * Remove file from DB action
         * @param array $options
         * @return array $result
         */
        public function removeAction($options) {
            // Set params
            $options['output'] = View::OUTPUT_TYPE_JSON;

            // Get file id and try to remove file
            $id = System::getInstance()->getCmd('id');
            $source = $this->model->remove($id);

            // Compile result
            if (!empty($source)) {
                $options['data'] = array('result' => 'success', 'source' => $source);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        /**
         * Remove file from FS action
         * @param array $options
         * @return array $result
         */
        public function deleteAction($options) {
            // Set params
            $options['output'] = View::OUTPUT_TYPE_JSON;

            if ($this->model->delete(System::getInstance()->getCmd('source'))) {
                $options['data'] = array('result' => 'success');
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        /**
         * Return add file form
         * @param array $options
         * @return array $result
         */
        public function getAddFormAction($options) {
            // Set params
            $options['output'] = View::OUTPUT_TYPE_JSON;

            $options['data']['source'] = System::getInstance()->getCmd('source');
            $options['data']['rel_id'] = System::getInstance()->getCmd('rel_id');

            if ($form = $this->view->getContents('file', 'add-file-form', $options)) {
                $options['data'] = array('result' => 'success', 'data' => $form);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        /**
         * Return delete file form
         * @param array $options
         * @return array $result
         */
        public function getDeleteFormAction($options) {
            // Set params
            $options['output'] = View::OUTPUT_TYPE_JSON;

            $options['data']['source'] = System::getInstance()->getCmd('source');
            $options['data']['rel_id'] = System::getInstance()->getCmd('rel_id');

            if ($form = $this->view->getContents('file', 'delete-file-form', $options)) {
                $options['data'] = array('result' => 'success', 'data' => $form);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }
    }
