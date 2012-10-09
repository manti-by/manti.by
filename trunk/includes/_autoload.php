<?php
    /**
     * Global autoload class
     * @name $_autoload
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @since 0.2RC1
     */

    class Autoload {

        private static $_lastLoadedFilename;

        public static function load($className) {
            if (preg_match('/(Controller|Model|View|Entity)/i', $className, $matches)) {
                $module_name = strtolower(substr($className, 0, strlen($className) - strlen(stristr($className, $matches[0]))));
                if (file_exists($file_name = ROOT_PATH . DS . 'modules' . DS . $module_name . DS . strtolower($matches[0]) . '.php')) {
                    self::$_lastLoadedFilename = $file_name;
                } else {
                    throw new Exception($className . ' ' . T('could not be found'));
                }
            } else {
                if (file_exists($file_name = LIB_PATH . DS . strtolower($className) . '.php')) {
                    self::$_lastLoadedFilename = $file_name;
                } else if (file_exists($file_name = LIB_PATH . DS . 'controls' . DS . strtolower($className) . '.php')) {
                    self::$_lastLoadedFilename = $file_name;
                } else {
                    throw new Exception($className . ' ' . T('could not be found'));
                }
            }
            require_once self::$_lastLoadedFilename;
        }
    }

    // Register our loader
    spl_autoload_register(array('Autoload', 'load'));
