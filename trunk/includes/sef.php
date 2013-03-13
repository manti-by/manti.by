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
     * Class for SEF url handlings
     * @name $sef
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @since 0.2RC1
     */
    class Sef extends Application {

        /**
         * @var array $character_replace_table replace table for strict symbols
         */
        public static $character_replace_table = array(
            'А'=>'A', 'Б'=>'B', 'В'=>'V', 'Г'=>'G',
            'Д'=>'D', 'Е'=>'E', 'Ж'=>'J', 'З'=>'Z',
            'И'=>'I', 'Й'=>'Y', 'К'=>'K', 'Л'=>'L',
            'М'=>'M', 'Н'=>'N', 'О'=>'O', 'П'=>'P',
            'Р'=>'R', 'С'=>'S', 'Т'=>'T', 'У'=>'U',
            'Ф'=>'F', 'Х'=>'H', 'Ц'=>'TS', 'Ч'=>'CH',
            'Ш'=>'SH', 'Щ'=>'SCH', 'Ъ'=>'', 'Ы'=>'YI',
            'Ь'=>'', 'Э'=>'E', 'Ю'=>'YU', 'Я'=>'YA',
            'а'=>'a', 'б'=>'b', 'в'=>'v', 'г'=>'g',
            'д'=>'d', 'е'=>'e', 'ж'=>'j', 'з'=>'z',
            'и'=>'i', 'й'=>'y', 'к'=>'k', 'л'=>'l',
            'м'=>'m', 'н'=>'n', 'о'=>'o', 'п'=>'p',
            'р'=>'r', 'с'=>'s', 'т'=>'t', 'у'=>'u',
            'ф'=>'f', 'х'=>'h', 'ц'=>'ts', 'ч'=>'ch',
            'ш'=>'sh', 'щ'=>'sch', 'ъ'=>'', 'ы'=>'yi',
            'ь'=>'', 'э'=>'e', 'ю'=>'yu', 'я'=>'ya',
            ' '=>'-', '.'=>'-', '?'=>'-', '/'=>'-',
            '\\'=>'-', '*'=>'-', ':'=>'-', '*'=>'-',
            '\''=>'-','<'=>'-', '>'=>'-','|'=>'-'
        );

        /**
         * @var object $instance self pointer
         */
        protected static $instance = null;

        /**
         * Singleton protection
         */
        protected function __construct() {
            // Init sef aliases storage
            if (!Cache::get('sef')) {
                Cache::set('sef', array());
            }
        }

        /**
         * GetInstance class method
         * @return Sef $instance
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
            $request = self::getReal(substr($_SERVER['REQUEST_URI'], 1));
            $result = substr(strstr($request, "?"), 1);
            if (!empty($result)) {
                parse_str($result, $_REQUEST);

                // Add POST params to request
                $_REQUEST = array_merge($_REQUEST, $_POST);
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
                $flip = array_flip($storage);
                return Application::$config['http_host'] . '/' . $flip[$link];
            }

            // Try to get real link
            $database = Database::getInstance();
            $database->query("CALL GET_SEF('".$database->escape($link)."');");
            $request = $database->getObject();
            if (!empty($request) && is_object($request)) {
                $request = $request->request;
            } else {
                $request = $link;
            }

            // Add to mem storage
            self::addToStorage($request, $link);
            return Application::$config['http_host'] . '/' . $request;
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
                return Application::$config['http_host'] . '/' . $storage[$request];
            }

            // Try to get real link
            $database = Database::getInstance();
            $database->query("CALL GET_SEF('".$database->escape($request)."');");
            if ($link = $database->getObject()) {
                $link = $link->link;
            } else {
                $link = self::createLink($request);
            }

            // Replace ampersands and add to mem storage
            self::addToStorage($request, $link);
            return Application::$config['http_host'] . '/' . str_replace('&', '&amp;', $link);
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
                    Database::getInstance()->query("CALL GET_SEF_MAP_ALIAS('".$source['field']."','".$source['table']."',".(int)$matches[1].");");

                    // Get alias and stop search
                    if ($alias = Database::getInstance()->getField()) {
                        $link = $source['prefix'] . $alias . $source['suffix'];
                        break;
                    }
                }
            }

            // If link not found by alias
            if (empty($link)) {
                // Explode request params
                $params = strchr($request, '?') ? substr(strstr($request, '?'), 1) : $request;
                parse_str($params, $source);

                // Add default route parts
                $source_link  = isset($source['module']) && !empty($source['module']) ? $source['module'] . '/' : '';
                $source_link .= isset($source['action']) && !empty($source['action']) ? $source['action'] . '/' : '';

                // Additional request params
                foreach ($source as $key => $value) {
                    if (!in_array($key, array('module', 'action', ''))) {
                        $source_link .= $key . '/' . $value . '/';
                    }
                }

                // Remove last slash and add sef suffix
                $source_link = substr($source_link, -1) == '/' ? substr($source_link, 0, strlen($source_link) - 1) : $source_link;
                $link = $source_link . Application::$config['sef_suffix'];
            }

            // Sanitize link
            $link = self::getInstance()->sanitizeLink($link);

            // Insert new route to redirection
            Database::getInstance()->query("CALL UPSERT_SEF('".Database::getInstance()->escape($request)."','".Database::getInstance()->escape($link)."');");

            // Add to aliases cache
            self::addToStorage($request, $link);

            if (Database::getInstance()->getField() > 0) {
                return $link;
            } else {
                return $request;
            }
        }

        /**
         * Check existing link in storage
         * @param string $link
         * @return string $link if exists
         */
        private static function checkStorage($link) {
            // Get storage data
            $data = Cache::get('sef');

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
            // Append new link to storage
            $storage = Cache::get('sef');
            $storage[$request] = $link;

            return Cache::set('sef', $storage);
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
            return Cache::get('sef');
        }

        /**
         * Remove from link spaces and non latin lettes
         * @param string $link link to sanitize
         * @return string $link
         */
        private function sanitizeLink($link) {
            return self::createAlias($link);
        }

        /**
         * Create alias from input string
         * @param string $string
         * @return string $string
         */
        public static function createAlias($string) {
            // Convert to lowercase and replace illegal characters
            $string = strtr(strtolower($string), self::$character_replace_table);

            // Remove duplicates
            $string = preg_replace("/-+/","-", $string);

            // Trim length and return
            return substr($string, 0, Application::$config['sef_max_alias_length']);
        }
    }