<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Class for SEF url handlings
     * @name $sef
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @since 0.2RC1
     * @todo TEST IT!!!
     */
    class Sef extends Application {
        private $storage;
        protected static $instance = null;

        /**
         * Singleton protection
         */
        protected function __construct() {
            // Try connect to DB
            $this->storage = array();

        }

        /**
         * GetInstance class method
         * @return Current_Class_Name $instance
         */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new Sef;
            }
            return self::$instance;
        }

        /**
         * Init SEF engine
         */
        public static function init() {
            // Get config
            if (!Application::$config['sef_enabled']) return;

            // Get global config
            $database = Database::getInstance();
            $database->query("CALL UPDATE_SEF_COUNTER('".$database->escape($_SERVER['REQUEST_URI'])."','".$database->escape($_SERVER['REQUEST_URI'])."');");

            // Get request string, delete question symbol and inject request data
            $request = substr(self::getReal($_SERVER['REQUEST_URI']), 1);
            if ($result = strstr($request, "?")) {
                parse_str($result, $_REQUEST);
            }
        }

        /**
         * Get real link from DB
         * @param string $link
         * @return string $request
         */
        public static function getReal($link) {
            // Get config
            if (!Application::$config['sef_enabled']) return $link;

            // Check memory, if exist, get array value by key
            if (self::checkStorage($link)) {
                $storage = self::getStorage();
                return $storage[$link];
            }

            // Try to get real link
            $database = Database::getInstance();
            $database->query("CALL GET_SEF('".$database->escape($link)."');");
            if ($request = $database->getObject()) {
                $request = $request->request;
            } else {
                $request = $link;
            }

            // Add to mem storage
            self::addToStorage($request, $link);
            return $request;
        }

        /**
         * Get sef link from DB
         * @param string $request
         * @return string $link
         */
        public static function getSef($request) {
            // Get config
            if (!Application::$config['sef_enabled']) return $request;

            // Check memory, if exist, get array value by value (flip)
            if (self::checkStorage($request)) {
                $storage = self::getStorage();
                $flip = array_flip($storage);
                return $flip[$request];
            }

            // Try to get real link
            $database = Database::getInstance();
            $database->query("CALL GET_SEF('".$database->escape($request)."');");
            if (!$link = $database->getObject()) {
                $link = $link->link;
            } else {
                $link = self::createLink($request);
            }

            // Replace ampersands and add to mem storage
            self::addToStorage($request, $link);
            return str_replace('&', '&amp;', $link);
        }

        /**
         * Create SEF link
         * @param string $request
         * @return string $link
         */
        private static function createLink($request) {
            // Get config
            if (!Application::$config['sef_enabled']) return $request;

            // Sef map creation
            $sef_map = include 'sef_map.php';

            // Search by pattern
            foreach($sef_map as $pattern => $source) {
                preg_match($pattern, $request, $matches);
                if ($matches) {
                    // If pattern found, get table and alias fields
                    $database = Database::getInstance();
                    $database->query("CALL GET_SEF_MAP_ALIAS('".$source['field']."','".$source['table']."',".(int)$matches[1].");");

                    // I dont understand, why it's happened
                    // but it's very strange... and we generate "date" for this
                    if (!$alias = $database->getField()) {
                        $alias = date('Y-m-d_H-i-s');
                    }

                    // Insert new route to redirection
                    $link = $source['prefix'] . $alias . $source['suffix'];
                    $database->query("CALL UPSERT_SEF('".$database->escape($request)."','".$database->escape($link)."');");

                    // Add to aliases cache
                    self::addToStorage($request, $link);

                    if ($database->getResult() > 0) {
                        return $link;
                    } else {
                        return $request;
                    }
                }
            }
            return $request;
        }

        /**
         * Check existing link in storage
         * @param string $link
         * @return string $link if exists
         */
        private static function checkStorage($link) {
            // Get storage data
            $data = self::getInstance()->getStorageData();

            // Check both array sides
            if (isset($data[$link])) {
                return true;
            } elseif (in_array($link, $data)) {
                return true;
            } else {
                return false;
            }
        }

        /**
         * STATIC: Add to storage sef request-link pair
         * @param string $request
         * @param string $link
         * @return bool $state
         */
        private static function addToStorage($request, $link) {
            // Check if already added
            if (self::checkStorage($request)) {
                return true;
            }

            // Add to object
            return self::getInstance()->addToStorageData($request, $link);
        }

        /**
         * Add to storage sef request-link pair
         * @param string $request
         * @param string $link
         * @return bool $state
         */
        private function addToStorageData($request, $link) {
            try {
                $this->storage[$request] = $link;
            } catch (Exception $e) {
                return $this->_throw($e->getMessage());
            }

            return true;
        }

        /**
         * STATIC: Get storage array of request-link pairs
         * @return array $storage
         */
        private static function getStorage() {
            return self::getInstance()->getStorageData();
        }

        /**
         * Get storage array of request-link pairs
         * @return array $storage
         */
        private function getStorageData() {
            return $this->storage;
        }
    }