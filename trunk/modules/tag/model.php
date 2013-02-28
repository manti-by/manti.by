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

        /**
         * Upsert tags and return its ids
         * @param string $tags comma separated list
         * @return array $result
         */
        public function processTags($tags) {
            $return = array();
            $this->database->query("CALL UPSERT_TAGS('". $tags ."');");
            $result = $this->database->getObjectsArray();
            if (!empty($result) && is_array($result)) {
                foreach ($result as $item) {
                    $return[] = $item->id;
                }
            }
            return $return;
        }

        /**
         * Get tags array by IDs string
         * @param string|array $ids
         * @return bool|array $tags
         */
        public function getTagsByIds($ids) {
            // Check if array
            if (is_array($ids)) {
                $ids = implode(',', $ids);
            }

            // Return result
            $result = false;
            if (!empty($ids)) {
                $this->database->query("CALL GET_TAGS_BY_IDS('". $ids ."');");
                $result =  $this->database->getPairs('id', 'name');
            }

            return is_array($result) ? $result : array();
        }

        /**
         * Get tags array by IDs string
         * @param int $id
         * @return bool|string $tag
         */
        public function getTagNameById($id) {
            // Check if array
            if ($id) {
                $tags = $this->getTagsByIds($id);
                return is_array($tags) ? current($tags) : false;
            }
            return false;
        }

        /**
         * Get tags array
         * @param int $limit OPTIONAL
         * @return bool|array $tags
         */
        public function getTags($limit = 10) {
            $this->database->query("CALL GET_TAGS($limit);");
            return $this->database->getObjectsArray();
        }

        /**
         * Tag aurocomlete data-provider
         * @param string $query
         * @return bool false
         */
        public function autocomplete($query = null) {
            $this->database->query("CALL SEARCH_TAGS('%". $query ."%');");
            return $this->database->getPairs('id', 'name');
        }
    }
