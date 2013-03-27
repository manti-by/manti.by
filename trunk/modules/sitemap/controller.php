<?php
    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @version     0.3
     * @package     M2 Micro Framework
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     *
     * NEW BSD LICENSE
     *
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions are met:
     *  * Redistributions of source code must retain the above copyright
     * notice, this list of conditions and the following disclaimer.
     *  * Redistributions in binary form must reproduce the above copyright
     * notice, this list of conditions and the following disclaimer in the
     * documentation and/or other materials provided with the distribution.
     *  * Neither the name of the "M2 Micro Framework" nor "manti.by" nor the
     * names of its contributors may be used to endorse or promote products
     * derived from this software without specific prior written permission.

     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
     * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
     * DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
     * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
     * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
     * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
     * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
     * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */

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

        /**
         * Track action for file item
         * @param array $options
         * @return array|bool $options
         */
        public function trackAction($options) {
            // Set output and get item ID
            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = System::getInstance()->getCmd('id');

            if ($count = $this->model->trackFileById($options['id'])) {
                $options['data'] = array('result' => 'success', 'count' => $count);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }
    }
