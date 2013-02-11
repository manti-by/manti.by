<?php
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
         * Available main post params
         * @var array
         */
        private $_main_post_params = array(
            'id', 'name', 'alias', 'teaser', 'description', 'metakeys', 'metadesc', 'is_music'
        );

        /**
         * Available music post params
         * @var array
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
