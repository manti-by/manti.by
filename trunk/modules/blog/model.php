<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc Blog Model class
      * @name $blogModel
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class BlogModel extends Model {
        
        public function getPost($id){
            // Check empty value
            if (empty($id)) {
                return false;
            }
            
            $this->database->query("CALL GET_POST_BY_ID($id)");
            if ($this->database->getResult() > 0) {
                return $this->database->getObjectsArray();
            } else {
                return false;
            }
        }
        
        public function getPosts($limit = 10){
            $this->database->query("CALL GET_POSTS($limit)");
            if ($this->database->getResult() > 0) {
                return $this->database->getObjectsArray();
            } else {
                return false;
            }
        }
        
        public function getPostsByTags($tags, $limit = 0){
            if (empty($tags)) {
                return $this->getPosts();
            }
            
            $tags = implode(',', $tags);
            $this->database->query("CALL GET_POSTS_BY_TAGS('$tags', $limit)");
            if ($this->database->getResult() > 0) {
                return $this->database->getObjectsArray();
            } else {
                return false;
            }
        }
    }
