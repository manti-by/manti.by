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
            case WARNING:
                return 'Warning';
                break;
            case NOTICE:
                return 'Notice';
                break;
            case MESSAGE:
                return 'Message';
                break;
            case ERROR:
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
    function T($text) {
        $language = (isset($_COOKIE['language']) ? $_COOKIE['language'] : 'en');
        $references = Cache::get('translations_' . $language);

        // Check language existance
        if (!is_array($references)) {
            $lang_file = ROOT_PATH . DS . 'language' . DS . $language . '.ini';
            if (file_exists($lang_file)) {
                $references = parse_ini_file($lang_file);
            } else {
                $lang_file = ROOT_PATH . DS . 'language' . DS . 'en.ini';
                $references = parse_ini_file($lang_file);
            }
            Cache::set('translations_' . $language, $references);
        }

        // Remove spaces and other characters
        $key = strtolower(str_replace(' ', '_', trim($text)));
        $key = preg_replace("/[^a-z_0-9]/i", "", $key);

        // Cut long strings
        if (strlen($key) > 16) {
            $key = substr($key, 0, 16) . '-' . strlen($key);
        }

        // Check for token and set to cache
        if (!array_key_exists($key, $references)) {
            $references[$key] = $text;
            Cache::set('translations_' . $language, $references);
        }

        return $references[$key];
    }

    /**
     * Remove from comma separated string array empty values
     * @param string $string
     * @return array $result
     */
    function cleanCommaString($string) {
        $result = explode(',', $string);
        $result = array_diff($result, array('', null));
        return implode(',', $result);
    }

    /**
     * Prepare PHP array to JSON array
     * @param mixed $array
     * @return mixed $result
     */
    function toJSNumArray($array) {
        if (is_array($array)) {
            $result = array();
            foreach ($array as $item) {
                $result[] = $item;
            }
            return $result;
        }
        return $array;
    }