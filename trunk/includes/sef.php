<?php
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
            // get global config
            $config = System::getInstance()->getConfig();
            $database = Database::getInstance();
            
            // update view counter
            $database->query("
                UPDATE `#__sef` 
                SET `viewed` = `viewed` + 1
                WHERE `request` = '".$database->escape($_SERVER['REQUEST_URI'])."' 
                   OR `link` = '".$database->escape($_SERVER['REQUEST_URI'])."'");
            
            // if sef enabled
            if ($config['sef_enabled']) {
                // get request string
                $request = substr(self::getReal($_SERVER['REQUEST_URI']), 1);
    
                // delete question symbol
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
            // get config
            $config = System::getInstance()->getConfig();
            if (!$config['sef_enabled']) return $link;

            // check memory
            if (self::checkStorage($link)) {
                // if exist, get array value by key
                $storage = self::getStorage();
                return $storage[$link];
            }

            // try to get real link
            $database = Database::getInstance();
            $result = $database->query("
                SELECT `request` FROM `#__sef` 
                WHERE `link` = '".$database->escape($link)."'");
            if ($result) {
                $request = $database->getField();

                // update view counter
                $database->query("
                    UPDATE `#__sef` SET `viewed` = `viewed` + 1
                    WHERE `link` = '".$database->escape($link)."'");
            } else {
                $request = $link;
            }

            // add to mem storage
            self::addToStorage($request, $link);
            return $request;
        }

        /**
          * Get sef link from DB
          * @param string $request
          * @return string $link
          */
        public static function getSef($request) {
            // get config
            $config = System::getInstance()->getConfig();
            if (!$config['sef_enabled']) return $request;

            // check memory
            if (self::checkStorage($request)) {
                $storage = self::getStorage();
                $flip = array_flip($storage);
                return $flip[$request];
            }            
            
            // try to get real link
            $database = Database::getInstance();
            $result = $database->query("
                SELECT `link` FROM `#__sef` 
                WHERE `request` = '".$database->escape($request)."'");
            if ($result) {
                $link = $database->getField();
            } else {
                // if request not in sef links, try to create it
                $link = self::createLink($request);
            }

            // replace ampersands and add to mem storage
            self::addToStorage($request, $link);
            return str_replace('&', '&amp;', $link);
        }

        /**
          * Create SEF link
          * @param string $request
          * @return string $link
          */
        private static function createLink($request) {
            // get config
            $config = System::getInstance()->getConfig();
            if (!$config['sef_enabled']) return $request;

            // sef map creation
            $sef_map = array(
                '/\?module\=blog\&action\=show\&id\=(.*)/' => array(
                    'table'  => 'post',
                    'field'  => 'alias',
                    'prefix' => '/blog/',
                    'suffix' => $config['sef_suffix']
                 )
            );

            // search by pattern
            foreach($sef_map as $pattern => $source) {
                preg_match($pattern, $request, $matches);
                if ($matches) {
                    // if pattern found, get table and alias fields
                    $database = Database::getInstance();
                    $result = $database->query("
                        SELECT `".$source['field']."` FROM `#__".$source['table']."` 
                        WHERE `id` = '".$matches[1]."'");

                    if ($result) {
                        $alias = $database->getField();
                    } else {
                        // @TODO: I dont understand, why it's happend
                        // but it's very strage... and we generate "date" for this
                        $alias = date('Y-m-d_H-i-s');
                    }

                    // Insert new route to redirection
                    $link = $source['prefix'] . $alias . $source['suffix'];
                    $database->query("
                        INSERT INTO `#__sef` (`request`, `link`)
                        VALUES ('".$database->escape($request)."', '".$database->escape($link)."');");

                    // add to aliases cache
                    $result = self::addToStorage($request, $link);
                    
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
            // get storage data
            $data = self::getInstance()->getStorageData();
            
            // check both array sides
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
            // check if already added
            if (self::checkStorage($request)) {
                return true;
            }
            
            // add to object
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
