<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Class for SEF url handlings
     * @name $sef
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @version 1.1
     */
    class Sef extends Application {
        private $storage;
        protected static $instance = null;

        /**
         * Singleton protection
         */
        private function __construct() {
            // Try connect to DB
            $this->storage = array();

        }
        private function __clone() {}
        private function __wakeup() {}

        /**
         * GetInstance class method
         * @return object $instance
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
            // Get global config
            $config = System::getInstance()->getConfig();
            $database = Database::getInstance();

            // Update view counter
            $database->query("
                    UPDATE `#___sef_alias`
                    SET `viewed` = `viewed` + 1
                    WHERE `request` = '".$database->escape($_SERVER['REQUEST_URI'])."'
                       OR `link` = '".$database->escape($_SERVER['REQUEST_URI'])."'");

            // If sef enabled
            if ($config['sef_enabled']) {
                // Get request string
                $request = substr(self::getReal($_SERVER['REQUEST_URI']), 1);

                // Delete question symbol
                // and inject request data
                $result = strstr($request, "?");
                if ($result) {
                    parse_str($result, $_REQUEST);
                }
            }
        }

        /**
         * Get real link from DB
         * @param string $link
         * @return string $request
         */
        public static function getReal($link) {
            // Get config
            $config = System::getInstance()->getConfig();
            if (!$config['sef_enabled']) return $link;

            // Check memory
            if (self::checkStorage($link)) {
                // if exist, get array value by key
                $storage = self::getStorage();
                return $storage[$link];
            }

            // Try to get real link
            $database = Database::getInstance();
            $result = $database->query("
                    SELECT `request` FROM `#___sef_alias`
                    WHERE `link` = '".$database->escape($link)."'");
            if ($result) {
                $request = $database->getField();

                // Update view counter
                $database->query("
                        UPDATE `#___sef_alias` SET `viewed` = `viewed` + 1
                        WHERE `link` = '".$database->escape($link)."'");
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
            $config = System::getInstance()->getConfig();
            if (!$config['sef_enabled']) return $request;

            // Check memory
            if (self::checkStorage($request)) {
                $storage = self::getStorage();
                $flip = array_flip($storage);
                return $flip[$request];
            }

            // Try to get real link
            $database = Database::getInstance();
            $result = $database->query("
                    SELECT `link` FROM `#___sef_alias`
                    WHERE `request` = '".$database->escape($request)."'");
            if ($result) {
                $link = $database->getField();
            } else {
                // If request not in sef links, try to create it
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
            $config = System::getInstance()->getConfig();
            if (!$config['sef_enabled']) return $request;

            // Sef map creation
            $sef_map = include 'sef_map.php';

            // Search by pattern
            foreach($sef_map as $pattern => $source) {
                preg_match($pattern, $request, $matches);
                if ($matches) {
                    // If pattern found, get table and alias fields
                    $database = Database::getInstance();
                    $result = $database->query("
                            SELECT `".$source['field']."` FROM `#__".$source['table']."`
                            WHERE `id` = '".$matches[1]."'");

                    if ($result) {
                        $alias = $database->getField();
                    } else {
                        // @TODO: I dont understand, why it's happend
                        // but it's very strange... and we generate "date" for this
                        $alias = date('Y-m-d_H-i-s');
                    }

                    // Insert new route to redirection
                    $link = $source['prefix'] . $alias . $source['suffix'];
                    $database->query("
                            INSERT INTO `#___sef_alias` (`request`, `link`)
                            VALUES ('".$database->escape($request)."', '".$database->escape($link)."');");

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
         * @param type $link
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