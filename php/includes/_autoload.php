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
     * Global autoload class
     * @name $_autoload
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @since 0.2RC1
     */

    class Autoload {

        /**
         * @var string|bool $_lastLoadedFilename last file for autoload
         */
        private static $_lastLoadedFilename;

        /**
         * Default application autoload funtion
         * @static
         * @param string $className
         */
        public static function load($className) {
            if (preg_match('/(Controller|Model|View|Entity)/i', $className, $matches)) {
                $module_name = strtolower(substr($className, 0, strlen($className) - strlen(stristr($className, $matches[0]))));
                if (file_exists($file_name = ROOT_PATH . DS . 'modules' . DS . $module_name . DS . strtolower($matches[0]) . '.php')) {
                    self::$_lastLoadedFilename = $file_name;
                } else {
                    Application::getInstance()->_throw($className . ' could not be found', WARNING);
                }
            } else {
                if (file_exists($file_name = LIB_PATH . DS . strtolower($className) . '.php')) {
                    self::$_lastLoadedFilename = $file_name;
                } else if (file_exists($file_name = LIB_PATH . DS . 'controls' . DS . strtolower($className) . '.php')) {
                    self::$_lastLoadedFilename = $file_name;
                } else {
                    Application::getInstance()->_throw($className . ' could not be found', WARNING);
                }
            }
            require_once self::$_lastLoadedFilename;
        }
    }

    // Register our loader
    spl_autoload_register(array('Autoload', 'load'));
