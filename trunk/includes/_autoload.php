<?php
    /**
      * Global autoload class
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      */

    class Autoload {

        private static $_lastLoadedFilename;

        public static function load($className) {
            if (preg_match('/(Controller|Model|View)/i', $className, $matches)) {
                $module_name = strtolower(substr($className, strlen(stristr($className, $matches[0]))));
                self::$_lastLoadedFilename = ROOT_PATH . DS . 'modules' . $module_name . DS . strtolower($matches[0]) . '.php';
            } else {
                self::$_lastLoadedFilename = LIB_PATH . DS . strtolower($className) . '.php';
            }
            require_once self::$_lastLoadedFilename;
        }
    }

    // Register our loader
    spl_autoload_register(array('Autoload', 'load'));
