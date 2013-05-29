<?php
    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @version     0.3
     * @package     M2 Micro Framework
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     *
     * NEW BSD LICENSE
     *
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions are met:
     *  * Redistributions of source code must retain the above copyright
     * notice, this list of conditions and the following disclaimer.
     *  * Redistributions in binary form must reproduce the above copyright
     * notice, this list of conditions and the following disclaimer in the
     * documentation and/or other materials provided with the distribution.
     *  * Neither the name of the "M2 Micro Framework" nor "manti.by" nor the
     * names of its contributors may be used to endorse or promote products
     * derived from this software without specific prior written permission.

     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
     * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
     * DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
     * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
     * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
     * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
     * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
     * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */

    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

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
     * Return index of error level
     * @param string $display_name
     * @return int $number error level
     */
    function getErrorIntFromString($display_name) {
        switch ($display_name) {
            case 'Warning':
                return WARNING;
                break;
            case 'Notice':
                return NOTICE;
                break;
            case 'Message':
                return MESSAGE;
                break;
            case 'Error':
            default:
                return ERROR;
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
        $language = (isset($_COOKIE['language']) ? $_COOKIE['language'] : 'ru');
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