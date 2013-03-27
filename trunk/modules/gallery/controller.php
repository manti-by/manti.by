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
     * Gallery Controller class
     * @name $galleryController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.2RC1
     */
    class GalleryController extends Controller {

        /**
         * Default gallery action
         * @param array $options
         * @return array $result
         */
        public function indexAction($options) {
            return $this->listAction($options);
        }

        /**
         * List gallery action
         * @param array $options
         * @return array $result
         */
        public function listAction($options) {
            // Get category ID
            $tags = System::getInstance()->getCmd('id');

            // Get category title
            if ($tags) {
                $options['data'] = $this->model->getGalleryByTags($tags);
                $options['title'] = 'Search by tags: ' . implode(', ', $tags);
            } else {
                $options['data'] = $this->model->getGallery();
                $options['title'] = T('Gallery of photo');
            }

            // Get category items and render it
            $options['module'] = 'gallery';
            $options['body'] = $this->view->renderItemsArray($options);

            return $this->view->wrapSidebar($options);
        }

        /**
         * Runs updates for files in gallery
         */
        public function updateFilesAction() {
            $options['output'] = View::OUTPUT_TYPE_JSON;

            // Check login state
            if (!UserEntity::getInstance()->isLoggined()) {
                // Compile error response
                $options['data'] = array(
                    'result' => 'error',
                    'message' => T('You do not have permissions to view this page')
                );
            } else {
                // Run actions and compile response
                $options['data'] = array(
                    'result' => 'success',
                    'message' => $this->view->wrapFileList(
                        $this->model->updateFSList()
                    )
                );
            }

            return $options;
        }

        /**
         * Rebuild thumbnails for images in gallery
         */
        public function rebuildThumbnailsAction() {
            $options['output'] = View::OUTPUT_TYPE_JSON;

            // Check login state
            if (!UserEntity::getInstance()->isLoggined()) {
                // Compile error response
                $options['data'] = array(
                    'result' => 'error',
                    'message' => T('You do not have permissions to view this page')
                );
            } else {
                // Run actions and compile response
                $options['data'] = array(
                    'result'  => 'success',
                    'message' => $this->view->wrapFileList(
                        $this->model->rebuildThumbnails()
                    )
                );
            }

            return $options;
        }

        /**
         * Show gallery by id
         * @param array $options
         * @return array|bool $options
         */
        public function showAction($options) {
            // Get item ID
            $options['id'] = System::getInstance()->getCmd('id');

            // Get item title and data
            if ($options['id']) {
                $options['data'] = $this->model->getGalleryById($options['id']);
                $options['title'] = $options['data']->name;
            } else {
                return $this->view->_404($options);
            }

            // Render blog item
            if (!empty($options['data'])) {
                $options['body'] = $this->view->getContents('gallery', 'full', $options);
                return $this->view->wrapSidebar($options);
            } else {
                return $this->view->_404($options);
            }
        }

        /**
         * Track action for full gallery view
         * @param array $options
         * @return array|bool $options
         */
        public function trackAction($options) {
            // Set output and get item ID
            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = System::getInstance()->getCmd('id');

            if ($count = $this->model->trackGallery($options['id'])) {
                $options['data'] = array('result' => 'success', 'count' => $count);
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        /**
         * Return next image by ID
         * @param array $options
         * @return array|bool $options
         */
        public function nextAction($options) {
            // Set output and get item ID
            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = System::getInstance()->getCmd('id');

            if ($result = $this->model->nextImage($options['id'])) {
                $options['data'] = array('result' => 'success', 'id' => $result->id, 'original' => Application::$config['http_host'] . substr($result->source, 1));
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }

        /**
         * Return previous image by ID
         * @param array $options
         * @return array|bool $options
         */
        public function prevAction($options) {
            // Set output and get item ID
            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = System::getInstance()->getCmd('id');

            if ($result = $this->model->prevImage($options['id'])) {
                $options['data'] = array('result' => 'success', 'id' => $result->id, 'original' => Application::$config['http_host'] . substr($result->source, 1));
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array('result' => 'error', 'error' => $error['message']);
            }

            return $options;
        }
    }
