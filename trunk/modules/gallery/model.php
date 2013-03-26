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
     * Gallery Model class
     * @name $galleryModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.2RC1
     */
    class GalleryModel extends Model {

        /**
         * @var string $file_path local file path to gallery
         */
        private $file_path;

        /**
         * @var string $link_path web path to gallery
         */
        private $link_path;

        /**
         * File model constructor
         */
        public function __construct() {
            parent::__construct();

            $this->file_path = realpath(ROOT_PATH . DS . Application::$config['gallery_path']);
            $this->link_path = Application::$config['http_host'] . Application::$config['gallery_path'];
        }

        /**
         * Return gallery array by tags
         * @param array $tags
         * @param int $limit
         * @return array|bool
         */
        public function getGalleryByTags($tags, $limit = 100) {
            if (empty($tags)) {
                return $this->getGallery();
            }

            $tags = implode(',', $tags);
            $this->database->query("CALL GET_GALLERY_BY_TAGS('$tags', $limit)");
            $galleries = $this->database->getObjectsArray();

            return $this->appendGalleriesImages($galleries);
        }

        /**
         * Get gallery list
         * @param int $limit
         * @return array|bool
         */
        public function getGallery($limit = 100) {
            // Get galleries list
            $this->database->query("CALL GET_GALLERY($limit)");
            $galleries = $this->database->getObjectsArray();

            return $this->appendGalleriesImages($galleries);
        }

        /**
         * Get gallery by id
         * @param int $id
         * @return object
         */
        public function getGalleryById($id) {
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('Gallery ID could not be empty'));
            }

            // Get galleries list
            $this->database->query("CALL GET_GALLERY_BY_ID($id)");
            $galleries = $this->database->getObjectsArray();

            return reset($this->appendGalleriesImages($galleries));
        }

        /**
         * Append galleries images
         * @param array $galleries objects
         * @return array $galleries objects
         */
        private function appendGalleriesImages($galleries) {
            // Append originals and thumbnails
            foreach ($galleries as $gallery) {
                $max_viewed = array('item' => null, 'viewed' => -1);
                $this->database->query("CALL GET_GALLERY_ITEMS_BY_ID(" . $gallery->id. ")");
                $gallery->originals = $this->database->getObjectsArray();

                // Add originals and thumbnails links
                if (count($gallery->originals)) {
                    foreach($gallery->originals as $original) {
                        // Update image link and path
                        $original->link = Application::$config['http_host'] . substr($original->source, 1);
                        $original->thumbnail = Application::$config['http_host'] . substr(str_replace('originals', 'thumbnails', $original->source), 1);

                        // Check max viewed
                        if ($max_viewed['viewed'] < $original->viewed) {
                            $max_viewed = array('item' => $original, 'viewed' => $original->viewed);
                        }
                    }
                }

                // Append max info
                $gallery->favorite = $max_viewed['item'];
            }

            return $galleries;
        }

        /**
         * Update gallery entries from FS to DB
         * @return array list of all new images from gallery path
         */
        public function updateFSlist() {
            $file_list = $db_files = array();

            // Get already stored files from DB
            $this->database->query("CALL GET_FILES('gallery', 0);");
            if ($this->database->checkResult()) {
                $db_files = $this->database->getPairs('id', 'source');
            }

            // Get all gallery images
            clearstatcache();
            $fileModel = Model::getModel('file');
            $galleries = $fileModel->getDirList($this->file_path . DS . 'originals', true);
            foreach ($galleries as $path => $data) {
                // Create gallery DB entry
                $dir_name = substr(strrchr($path, '/'), 1);
                $dir_name = $this->database->escape($dir_name);
                $this->database->query("CALL UPSERT_GALLERY(0, '" . $this->database->escape($path) . "', '" . ucfirst($dir_name) . "',  '" . strtolower($dir_name) . "', '', '');");
                $gallery_id = $this->database->getField();

                // Parse files from directory
                foreach ($fileModel->getDirList($path) as $source => $fileinfo) {
                    // If file exists
                    if (realpath(ROOT_PATH . DS . $source)) {
                        // And not already stored in DB
                        if (!in_array($source, $db_files)) {
                            // Add record to files table
                            if ($file_id = $fileModel->add(array('source'=> $source, 'type' => 'gallery',))) {
                                // And add linkage to gallery
                                $this->database->query("CALL UPSERT_GALLERY_FILES(" . $gallery_id . ", " . $file_id . ");");
                                if ($this->database->getField()) {
                                    $file_list[] = array(
                                        'source' => $source,
                                        'status' => T('Stored in DB')
                                    );
                                } else {
                                    // @todo Add error handler for file dublicates
                                    /*$message = $this->getLastFromStack();
                                    $file_list[] = array(
                                        'source' => $source,
                                        'status' => $message['message']
                                    );*/
                                }
                            } else {
                                $message = $this->getLastFromStack();
                                $file_list[] = array(
                                    'source' => $source,
                                    'status' => $message['message']
                                );
                            }
                        }
                    }
                }
            }

            return $file_list;
        }

        /**
         * Batch resize for gallery originals
         * @return array list of all resized images
         */
        public function rebuildThumbnails() {
            $resized = $db_files = array();

            // Get all registered images
            $this->database->query("CALL GET_FILES('gallery', 1000);");
            if ($this->database->checkResult()) {
                $db_files = $this->database->getPairs('id', 'source');
            }

            // Rebuild thumbnails
            foreach($db_files as $source) {
                // Generate thumbnail pathes
                $pathinfo = pathinfo($source);
                $thumbpath = $this->file_path . DS . 'thumbnails' . strrchr($pathinfo['dirname'], '/');
                $thumbname = $thumbpath . DS . $pathinfo['basename'];

                // Check directory path and try to create it
                if (!file_exists($thumbpath)) {
                    if (!mkdir($thumbpath)) {
                        $message = T('Could not create thumbnail directory');
                        $this->_throw($message);

                        $resized[] = array(
                            'source' => $thumbpath,
                            'status' => $message
                        );

                        continue;
                    }
                }

                // Remove old thumbnail
                if (file_exists($thumbname)) {
                    unlink($thumbname);
                }

                // And try to create new
                if (System::getInstance()->resize($source, $thumbname, Application::$config['thumb_width'], Application::$config['thumb_height'], System::RESIZE_WITH_CROP)) {
                    $resized[] = array(
                        'source' => $source,
                        'status' => T('Successfully resized')
                    );
                } else {
                    $message = $this->getLastFromStack();
                    $resized[] = array(
                        'source' => $source,
                        'status' => $message['message']
                    );
                }
            }

            return $resized;
        }

        /**
         * Track gallery by id
         * @param int $id
         * @return bool|object $result
         */
        public function trackGallery($id){
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('Gallery ID could not be empty'));
            }

            $this->database->query("CALL TRACK_GALLERY_BY_ID($id);");
            return $this->database->getField();
        }

        /**
         * Return next image by id
         * @param int $id
         * @return bool|object $result
         */
        public function nextImage($id){
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('Image ID could not be empty'));
            }

            $this->database->query("CALL GET_NEXT_IMAGE_BY_ID($id);");
            return $this->database->getObject();
        }

        /**
         * Return prev image by id
         * @param int $id
         * @return bool|object $result
         */
        public function prevImage($id){
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('Image ID could not be empty'));
            }

            $this->database->query("CALL GET_PREV_IMAGE_BY_ID($id);");
            return $this->database->getObject();
        }

        /**
         * Return latest gallery images
         * @param int $limit
         * @return array|bool
         */
        public function getLatestImages($limit = 100) {
            $this->database->query("CALL GET_LATEST_IMAGES($limit)");
            return $this->database->getObjectsArray();
        }

        /**
         * Return popular gallery images
         * @param int $limit
         * @return array|bool
         */
        public function getPopularImages($limit = 100) {
            $this->database->query("CALL GET_POPULAR_IMAGES($limit)");
            return $this->database->getObjectsArray();
        }
    }