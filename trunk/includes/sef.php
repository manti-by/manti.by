<?php
    /**
      * Class for SEF url handlings
      * @name $sef
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      * @version 1.0
      */
    class Sef extends Application {
        private $alias;
        private $database;
        
        /**
          * Default cunstructor for SEF 
          */
        public function __construct() {
            $this->alias = array();
            $this->database = Database::getInstance();
        }
        
        /**
          * Init SEF engine
          */
        public static function init() {
            // get global config
            $config = System::getInstance()->getConfig();
            
            // update view counter
            $this->database->query("
                UPDATE `#__sef_alias` 
                SET `viewed` = `viewed` + 1
                WHERE `request` = '".$this->database->escape($_SERVER['REQUEST_URI'])."' 
                   OR `alias` = '".$this->database->escape($_SERVER['REQUEST_URI'])."'");
            
            // if sef enabled
            if ($config['sef_enabled']) {
                // get request string
                $request = substr(self::getReal($_SERVER['REQUEST_URI']), 1);
    
                // delete question symbol
                // and check, if we have request alias
                $result = strstr($request, "?");
                if ($result) {
                    $route = explode('&', $result);
                    foreach($route as $item) {
                        $value = explode('=', $item);
                        $_REQUEST[$value[0]] = $_REQUEST[$value[1]];
                    }
                }
            }
        }
        
        /**
          * Get real link from DB
          * @param string $link
          * @return string $request
          */
        public static function getReal($link) {
            // check memory
            if ($this->sefMemCheck($link)) {
                // if exist, get array value by key
                return $this->alias[$link];
            }            
            
            // try to get real link
            $result = $this->database->query("
                SELECT `request` FROM `#__sef_alias` 
                WHERE `link` = '".$this->database->escape($link)."'");
            if ($result) {
                $request = $this->database->getField();

                // update view counter
                $this->database->query("
                    UPDATE `#__sef_aliases` SET `viewed` = `viewed` + 1
                    WHERE `link` = '".$this->database->escape($link)."'");
            } else {
                $request = $link;
            }

            // add to mem storage
            $this->addToMemory($request, $link);
            return $request;
        }

        /**
          * Get sef link from DB
          * @param string $request
          * @return string $link
          */
        public static function getSef($request) {
            // check memory
            if ($this->sefMemCheck($request)) {
                $flip = array_flip($this->alias);
                return $flip[$request];
            }            
            
            // try to get real link
            $result = $this->database->query("
                SELECT `link` FROM `#__sef_alias` 
                WHERE `request` = '".$this->database->escape($request)."'");
            if ($result) {
                $link = $this->database->getField();
            } else {
                // if request not in sef links, try to create it
                $link = self::createLink($request);
            }

            // replace ampersands and add to mem storage
            $this->addToMemory($request, $link);
            return str_replace('&', '&amp;', $link);
        }

        /**
          * Create SEF link
          * @param string $request
          * @return string $link
          */
        private static function createLink($request) {
            $config = System::getInstance()->getConfig();
            
            $sef_map = array(
                '/\?module\=blog\&action\=show\&id\=(.*)/' => array(
                    'table'  => 'blog',
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
                    $result = $this->database->query("
                        SELECT `".$source['field']."` FROM `#__".$source['table']."` 
                        WHERE `id` = '".$matches[1]."'");

                    if ($result) {
                        $alias = $this->database->getField();
                    } else {
                        // @TODO: I dont understand, why it's happend
                        // but it's very strage... and we generate "date" for this
                        $alias = date('Y-m-d_H-i-s');
                    }

                    // Insert new route to redirection
                    $link = $source['prefix'] . $alias . $source['suffix'];
                    $database->query("
                        INSERT INTO `#__sef_alias` (`request`, `link`)
                        VALUES ('".$this->database->escape($request)."', '".$this->database->escape($link)."');");

                    // add to aliases cache
                    $this->alias[$request] = $link;
                    
                    if ($this->database->getResult() > 0) {
                        return $link;
                    } else {
                        return $request;
                    }
                }
            }
            return $request;
        }
        
        /**
          * Check existing link
          * @param type $link 
          * @return string $link if exists
          */
        public function sefMemCheck($link) {
            if (isset($this->alias[$link])) {
                return true;
            } elseif (in_array($link, $this->alias)) {
                return true;
            } else {
                return false;
            }
        }
        
        /**
          * Add to mem sef request-link pair
          * @param string $request 
          * @param string $link 
          * @return bool $state
          */
        private function addToMemory($request, $link) {
            $this->alias[$link] = $request;
        }
    }
