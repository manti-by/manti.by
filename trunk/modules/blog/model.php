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
        
        public function getCategory($id){
            // check empty value
            if (empty($id)) {
                return false;
            }
            
            $this->database->query("SELECT * FROM `category` WHERE `id` = " . $id);
            if ($this->database->getResult() > 0) {
                return $this->database->getObjectsArray();
            } else {
                return false;
            }
        }
        
        public function getCategoryItems($id){
            // check empty value
            if (empty($id)) {
                return false;
            }
            
            $this->database->query("
                SELECT p.*, c.`name` as category FROM `post` p
                JOIN `category` c ON c.`id` = p.`category_id`
                WHERE `category_id` = " . $id);
            
            if ($this->database->getResult() > 0) {
                return $this->database->getObjectsArray();
            } else {
                return false;
            }
        }
    }
