<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Tag Model class
     * @name $tagModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class TagModel extends Model {
        
        public function getPosts($limit = 10){
            $this->database->query("CALL GET_POSTS($limit)");
            return $this->database->getObjectsArray();
        }
        
        public function getPostsByTags($tags, $limit = 0){
            if (empty($tags)) {
                return $this->getPosts();
            }
            
            $tags = implode(',', $tags);
            $this->database->query("CALL GET_POSTS_BY_TAGS('$tags', $limit)");
            return $this->database->getObjectsArray();
        }

        /**
         * Upsert tags and return its ids
         * @param string $tags comma separated list
         * @return array $result
         */
        public function processTags($tags) {
            $return = array();
            $this->database->query("CALL UPSERT_TAGS('". $tags ."');");
            if ($result = $this->database->getObjectsArray()) {
                foreach ($result as $item) {
                    $return[] = $item->id;
                }
            }
            return $return;
        }
    }
