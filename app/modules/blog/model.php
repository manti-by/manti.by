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
     * Blog Model class
     * @name $blogModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class BlogModel extends Model {

        /**
         * @var array $_main_post_params available main post params
         */
        private $_main_post_params = array(
            'id', 'name', 'alias', 'teaser', 'description', 'metakeys', 'metadesc', 'is_music'
        );

        /**
         * @var array $_music_post_params available music post params
         */
        private $_music_post_params = array(
            'attachments', 'relations', 'catnum', 'genre', 'quality', 'length', 'tracklist'
        );

        /**
         * Return post by id
         * @param int $id
         * @return bool|object $result
         */
        public function getPost($id){
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('Post ID could not be empty'));
            }
            
            $this->database->query("CALL GET_POST_BY_ID($id);");
            return $this->database->getObject();
        }

        /**
         * Return posts array
         * @param int $limit OPTIONAL
         * @param int $page OPTIONAL
         * @return array|bool $result
         */
        public function getPosts($limit = null, $page = 1) {
            $limit = empty($limit) ? Application::$config['posts_per_page'] : $limit;
            $limitstart = empty($page) ? 0 : $limit * ($page - 1);

            $this->database->query("CALL GET_POSTS($limitstart, $limit);");
            return $this->database->getObjectsArray();
        }

        /**
         * Return posts array by tags
         * @param string $tags
         * @param int $limit OPTIONAL
         * @return array|bool $result
         */
        public function getPostsByTags($tags, $limit = 10){
            if (empty($tags)) {
                $this->_throw(T('There are no posts found by search criteria'), MESSAGE);
                return $this->getPosts();
            }

            $this->database->query("CALL GET_POSTS_BY_TAGS('$tags', $limit);");
            return $this->database->getObjectsArray();
        }

        /**
         * Return posts by tag id
         * @param int $tag_id
         * @param int $limit OPTIONAL
         * @return array|bool $result
         */
        public function getPostsByTagId($tag_id, $limit = 10){
            if (empty($tag_id)) {
                $this->_throw(T('There are no posts found by search criteria'), MESSAGE);
                return $this->getPosts();
            }

            $this->database->query("CALL GET_POSTS_BY_TAG_ID($tag_id, $limit);");
            return $this->database->getObjectsArray();
        }

        /**
         * Return post relations by post id
         * @param int $id
         * @return array|bool $result
         */
        public function getPostRelationsById($id){
            // Get existing relations
            $id = (int)$id;
            if ($id > 0) {
                $this->database->query("CALL GET_POST_RELATIONS($id);");
                $result = $this->database->getPairs('id', 'name');
                if (is_array($result)) return $result;
            }
            return array();
        }

        /**
         * Save post to DB
         * @param array $options
         * @return int|bool $post_id
         */
        public function savePost($options) {
            // Process tags
            $options['metakeys'] = cleanCommaString($options['metakeys']);
            $options['metakeys'] = implode(',', Model::getModel('tag')->processTags($options['metakeys']));

            // Process attachments
            $options['attachments'] = array_merge(
                explode(',', $options['preview']),
                explode(',', $options['release']),
                explode(',', $options['covers'])
            );
            $options['attachments'] = cleanCommaString(implode(',', $options['attachments']));

            // Check UPSERT params
            if ((int)$options['is_music']) {
                $keys = array_flip($this->_main_post_params) + array_flip($this->_music_post_params);
                $params = array_intersect_key($options, $keys);
            } else {
                $params = array_intersect_key($options, array_flip($this->_main_post_params));
                $params += array_fill(0, count($this->_music_post_params), '');
            }

            // Quote strings
            foreach ($params as $key => $value) {
                if (is_string($value)) {
                    $params[$key] = "'" . $value . "'";
                }
            }

            $this->database->query("CALL UPSERT_POST(". implode(',', $params) .");");
            return $this->database->getField();
        }

        /**
         * Delete post by id
         * @param int $id
         * @return bool|object $result
         */
        public function deletePost($id){
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('Post ID could not be empty'));
            }

            return $this->database->query("CALL DELETE_POST_BY_ID($id);");
        }

        /**
         * Track post by id
         * @param int $id
         * @return bool|object $result
         */
        public function trackPost($id){
            // Check empty value
            if (empty($id)) {
                return $this->_throw(T('Post ID could not be empty'));
            }

            $this->database->query("CALL TRACK_POST_BY_ID($id);");
            return $this->database->getField();
        }
    }
