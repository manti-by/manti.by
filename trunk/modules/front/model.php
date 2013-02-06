<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Front Model class
     * @name $frontModel
     * @package M2 Micro Framework
     * @subpackage Modules
     * @author Alexander Chaika
     * @since 0.1
     */
    class FrontModel extends Model {

        /**
         * @const Featured tag name
         */
        const FEATURED_TAG_NAME = 'Featured';

        /**
         * Get frontpage items array
         * @return array|bool $result
         */
        public function getFrontpageItems() {
            // Create in_use and result arrays
            $in_use = array();
            $result = array(
                'featured' => array(),
                'popular'  => array(),
                'content'  => array()
            );

            // Get featured posts
            $this->database->query("CALL GET_POSTS_BY_TAGS('".FrontModel::FEATURED_TAG_NAME."', 10);");
            $featured = $this->database->getObjectsArray();
            foreach ($featured as $item) {
                if (!in_array($item->id, $in_use)) {
                    $result['featured'][] = $item;
                    $in_use[] = $item->id;
                }

                // Break when done
                if (count($result['featured']) >= Application::$config['featured_count']) {
                    break;
                }
            }

            // Get all posts
            $this->database->query("CALL GET_POSTS_BY_VIEW_COUNT(10);");
            $posts = $this->database->getObjectsArray();
            foreach ($posts as $item) {
                if (!in_array($item->id, $in_use)) {
                    $result['popular'][] = $item;
                    $in_use[] = $item->id;
                }

                // Break when done
                if (count($result['popular']) >= Application::$config['popular_count']) {
                    // Search content items
                    if (!in_array($item->id, $in_use)) {
                        $result['content'][] = $item;
                        $in_use[] = $item->id;
                    }

                    if (count($result['content']) >= Application::$config['content_count']) {
                        break;
                    }
                }
            }

            return $result;
        }
    }
