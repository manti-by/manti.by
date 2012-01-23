<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Global system functions
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
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
      * convert "bad" OS path slashes
      * @param string $path
      * @return string $converted_path
      */
    function convertOSPath($path) {
        $win_ds = '\\';
        $nix_ds = '/';
        
        // check directory separator
        // replace and remove dublicates
        if ($nix_ds == DS) {
            $result = str_replace($win_ds, $nix_ds, $path);
            $result = str_replace($nix_ds.$nix_ds, $nix_ds, $path);
        } else {
            $result = str_replace($nix_ds, $win_ds, $path);
            $result = str_replace($win_ds.$win_ds, $win_ds, $path);
        }
        
        return $result;
    }
    
    /**
      * Function for translate tokens from dictionaries
      * @param string $text text to translate
      * @param string $language optional translate to
      * @return string $text translated text
      */
    function T($text){
        $language = (isset($_COOKIE['language']) ? $_COOKIE['language'] : 'en');
        
        // check language existance
        $lang_file = dirname(dirname(__FILE__)) . DS . 'language' . DS . $language . '.ini';
        if (file_exists($lang_file)) {
            $references = parse_ini_file($lang_file);
        } else {
            $lang_file = dirname(dirname(__FILE__)) . DS . 'language' . DS . 'en.ini';
            $references = parse_ini_file($lang_file);
        }

        // remove spaces
        $key = strtolower(str_replace(' ', '_', $text));

        // check for token
        if (array_key_exists($text, $references)) {
            return $references[$key];
        } else {
            // write key to ini file
            $lang_file = dirname(dirname(__FILE__)) . DS . 'language' . DS . 'en.ini';
            $handler = fopen($lang_file, 'a');
            fwrite($handler, $key . ' = "' . $text . '"' . NL);
            fclose($handler);
            
            return $text;
        }
    }
