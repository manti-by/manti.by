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

        public function savePost($options){
            // $this->database->query("CALL UPSERT_POST();");
            return 1;
        }
    }
