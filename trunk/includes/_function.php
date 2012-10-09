<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Global system functions
     * @name $_functions
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @since 0.2RC1
     */

    /**
     * Return human representation of error level
     * @param int $number error level
     * @return string $display_name
     */
    function getErrorStringFromInt($number) {
        switch ($number) {
            case 2:
                return 'Warning';
                break;
            case 6:
                return 'Notice';
                break;
            case 8:
                return 'Message';
                break;
            default:
                return 'Error';
                break;
        }
    }

    /**
     * Return first applicable module
     * @return bool|string $module_name
     */
    function getDefaultModule() {
        $search_path = opendir(dirname(dirname(__FILE__)) . DS . 'modules');

        while (($current = readdir($search_path)) !== false) {
            if (is_dir($current) && $current != '.' && $current != '..') {
                return $current;
            }
        }
        closedir($search_path);

        return false;

    }

    /**
     * Function for translate tokens from dictionaries
     * @param string $text text to translate
     * @return string $text translated text
     */
    function T($text){
        $language = (isset($_COOKIE['language']) ? $_COOKIE['language'] : 'en');

        // Check language existance
        $lang_file = ROOT_PATH . DS . 'language' . DS . $language . '.ini';
        if (file_exists($lang_file)) {
            $references = parse_ini_file($lang_file);
        } else {
            $lang_file = ROOT_PATH . DS . 'language' . DS . 'en.ini';
            $references = parse_ini_file($lang_file);
        }

        // Remove spaces and other characters
        $key = strtolower(str_replace(' ', '_', trim($text)));
        $key = preg_replace("/[^a-z_0-9]/i", "", $key);

        // Cut long strings
        if (strlen($key) > 16) {
            $key = substr($key, 0, 16) . '-' . strlen($key);
        }

        // Check for token
        if (array_key_exists($key, $references)) {
            return $references[$key];
        } else {
            // Write key to ini file
            if (strlen($key) > 0 && strlen($text) > 0) {
                $lang_file = dirname(dirname(__FILE__)) . DS . 'language' . DS . 'en.ini';
                $handler = fopen($lang_file, 'a');
                fwrite($handler, $key . ' = "' . $text . '"' . NL);
                fclose($handler);
            }

            return $text;
        }
    }