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
     * Blog Controller class
     * @name $blogController
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class BlogController extends Controller {

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
                $options['show_only_music'] = 1;
                $options['data'] = $this->model->getPosts(Application::$config['posts_per_page'], $options['page']);
                $options['title'] = T('Blog');
            }

            // Append meta info
            Model::getModel('tag')->appendMetakeys($options);

            // Get items and render it
            if (!empty($options['data'])) {
                $options['module'] = 'blog';
                $options['body'] = $this->view->renderItemsArray($options);

                // Add ajax loader
                $options['body'] .= $this->view->getContents('blog', 'ajax', $options);

                return $this->view->wrapSidebar($options);
            } else {
                return $this->view->_404($options);
            }
        }

        /**
         * List blog posts with tags
         * @param array $options
         * @return array $options
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
            // Check print template
            $options['is_print'] = System::getInstance()->getCmd('print');
            $options['output'] = $options['is_print'] ? View::OUTPUT_TYPE_PRINT : View::OUTPUT_TYPE_DEFAULT;

            // Get item ID
            $options['id'] = System::getInstance()->getCmd('id');
            
            // Get item title and data
            if ($options['id']) {
                $options['data'] = $this->model->getPost($options['id']);
                $options['title'] = $options['data']->name . ($options['data']->genre ? ' /' . $options['data']->genre . '/' : '');
            } else {
                return $this->view->_404($options);
            }

            // Append meta info
            Model::getModel('tag')->appendMetakeys($options);
            Model::getModel('tag')->replaceMetadesc($options);

            // Render blog item
            if (!empty($options['data'])) {
                $options['body'] = $this->view->getContents('blog', 'item-full', $options);
                return $options;
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
            // Check login state
            if (!UserEntity::getInstance()->isLoggined()) {
                $this->_throw(T('You do not have permissions to view this page'));
                return $this->view->_404();
            }

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
            // Check login state
            if (!UserEntity::getInstance()->isLoggined()) {
                $this->_throw(T('You do not have permissions to view this page'));
                return $this->view->_404();
            }

            $system = System::getInstance();

            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = $system->getCmd('id', 0);

            $options['name'] = $system->getCmd('name', '');
            if (empty($options['name'])) {
                $options['data'] = array(
                    'result'  => 'error',
                    'message' => T('Post title could not be empty')
                );
                return $options;
            }

            $options['alias'] = $system->getCmd('alias', $options['name']);
            $options['alias'] = Sef::createAlias($options['alias']);

            // #43634275 - Prevent flip for teaser and description
            $options['teaser'] = $system->getCmd('teaser', '');

            $options['description'] = $system->getCmd('description', '');
            if (empty($options['description'])) {
                $options['data'] = array(
                    'result'  => 'error',
                    'message' => T('Post description could not be empty')
                );
                return $options;
            }

            if (empty($options['teaser'])) {
                $options['teaser'] = strip_tags($options['description']);
            }
            $options['teaser'] = substr($options['teaser'], 0, Application::$config['teaser_length']);

            $options['metakeys'] = $system->getCmd('metakeys', '');

            $options['metadesc'] = $system->getCmd('metadesc', '');
            if (empty($options['metadesc'])) {
                $options['metadesc'] = strip_tags($options['description']);
            }
            $options['metadesc'] = substr($options['metadesc'], 0, Application::$config['metadesc_length']);

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
                $options['data'] = array(
                    'result'  => 'success',
                    'id'      => $options['result'],
                    'options' => $options
                );
            } else {
                $error =  $this->getLastFromStack();
                $options['data'] = array(
                    'result'  => 'error',
                    'message' => $error['message']
                );
            }
            
            return $options;
        }

        /**
         * Delete action for blog post
         * @param array $options
         * @return array|bool $options
         */
        public function deleteAction($options) {
            // Check login state
            if (!UserEntity::getInstance()->isLoggined()) {
                $this->_throw(T('You do not have permissions to view this page'));
                return $this->view->_404();
            }

            // Set output and get item ID
            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = System::getInstance()->getCmd('id');

            if ($this->model->deletePost($options['id'])) {
                $options['data'] = array(
                    'result'  => 'success',
                    'message' => T('Post deleted successfully')
                );
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array(
                    'result'  => 'error',
                    'message' => $error['message']
                );
            }

            return $options;
        }

        /**
         * Track action for blog post
         * @param array $options
         * @return array|bool $options
         */
        public function trackAction($options) {
            // Set output and get item ID
            $options['output'] = View::OUTPUT_TYPE_JSON;
            $options['id'] = System::getInstance()->getCmd('id');

            if ($count = $this->model->trackPost($options['id'])) {
                $options['data'] = array(
                    'result' => 'success',
                    'count'  => $count
                );
            } else {
                $error = $this->getLastFromStack();
                $options['data'] = array(
                    'result'  => 'error',
                    'message' => $error['message']
                );
            }
        }
    }
