<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog Model class
     * @name $blogModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     * @todo savePost()
     */
    class BlogModel extends Model {

        private $_main_post_params = array(
            'id', 'name', 'teaser', 'description', 'metakeys', 'metadesc', 'is_music'
        );

        private $_music_post_params = array(
            'attachments', 'relations', 'catnum', 'genre', 'quality', 'length', 'tracklist'
        );

        public function getPost($id){
            // Check empty value
            if (empty($id)) {
                return false;
            }
            
            $this->database->query("CALL GET_POST_BY_ID($id);");
            return $this->database->getObjectsArray();
        }
        
        public function getPosts($limit = 10){
            $this->database->query("CALL GET_POSTS($limit);");
            return $this->database->getObjectsArray();
        }
        
        public function getPostsByTags($tags, $limit = 0){
            if (empty($tags)) {
                return $this->getPosts();
            }

            $tags = implode(',', $tags);
            $this->database->query("CALL GET_POSTS_BY_TAGS('$tags', $limit);");
            return $this->database->getObjectsArray();
        }

        public function getRelations($id){
            $id = (int)$id;
            $this->database->query("CALL GET_POST_RELATIONS($id);");
            return $this->database->getPairs('id', 'name');
        }

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
    }
