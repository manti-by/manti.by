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
      * Cache Class
      * @name $cache
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      * @since 0.3RC2
      */
    class Cache extends Application {

        const TYPE_DEFAULT  = 3;

        const TYPE_SESSION  = 1;
        const TYPE_MEMORY   = 2;
        const TYPE_MEMCACHE = 3;

        /**
         * @var array $_data local memory storage
         */
        private $_data = array();

        /**
         * @var object $instance self pointer
         */
        protected static $instance = null;

        /**
         * @var resource $memcache connection resource
         */
        protected static $memcache = null;

        /**
         * GetInstance class method
         * @return Cache $instance
         */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new Cache;
            }
            return self::$instance;
        }

        /**
         * Get memcache objects
         * @throws Exception
         * @return Cache $instance
         */
        public static function getMemcache() {
            ob_start();
            if (is_null(self::$memcache)) {
                try {
                    self::$memcache = new Memcache;
                    if (!self::$memcache->pconnect(Application::$config['memcache_host'], Application::$config['memcache_port'])) {
                        throw new Exception('Please check connection properties');
                    }
                } catch (Exception $e) {
                    ob_end_clean();
                    return self::getInstance()->_throw(T('Could not connect to memcache: ') . $e->getMessage(), ERROR);
                }
            }

            ob_end_clean();
            return self::$memcache;
        }

        /**
         * Set data to storage
         * @param string $key
         * @param mixed $value
         * @param int $storage (OPTIONAL)
         * @return mixed $value
         */
        public function setData($key, $value, $storage = Cache::TYPE_DEFAULT) {
            switch ($storage) {
                case Cache::TYPE_SESSION:
                    $_SESSION[$key] = $value;
                    break;
                case Cache::TYPE_MEMORY :
                    $this->_data[$key] = $value;
                    break;
                case Cache::TYPE_MEMCACHE :
                    if ($memcache = self::getMemcache()) {
                        return $memcache->set($key, $value) ? $value : false;
                    } else {
                        return false;
                    }
                    break;
            }

            return $value;
        }

        /**
         * Uppend existing data in storage
         * @param string $key
         * @param mixed $value
         * @param int $storage (OPTIONAL)
         * @return mixed $value
         */
        public function appendData($key, $value, $storage = Cache::TYPE_DEFAULT) {
            switch ($storage) {
                case Cache::TYPE_SESSION:
                    if (isset($_SESSION[$key])) {
                        if (is_array($_SESSION[$key])) {
                            $_SESSION[$key][] = $value;
                        } else {
                            $_SESSION[$key] .= $value;
                        }
                        return $_SESSION[$key];
                    }
                    break;
                case Cache::TYPE_MEMORY :
                    if (isset($this->_data[$key])) {
                        if (is_array($this->_data[$key])) {
                            $this->_data[$key][] = $value;
                        } else {
                            $this->_data[$key] .= $value;
                        }
                        return $this->_data[$key];
                    }
                    break;
                case Cache::TYPE_MEMCACHE :
                    if ($memcache = self::getMemcache()) {
                        $data = $memcache->get($key);
                        if (is_array($data)) {
                            $data[] = $value;
                        } else {
                            $data .= $value;
                        }
                        return $memcache->set($key, $data);
                    } else {
                        return false;
                    }
                    break;
            }

            return $value;
        }

        /**
         * Get data from storage
         * @param string $key
         * @param int $storage (OPTIONAL)
         * @return mixed|null $value
         */
        public function getData($key, $storage = Cache::TYPE_DEFAULT) {
            switch ($storage) {
                case Cache::TYPE_SESSION:
                    if (isset($_SESSION[$key])) {
                        return $_SESSION[$key];
                    }
                    break;
                case Cache::TYPE_MEMORY :
                    if (isset($this->_data[$key])) {
                        return $this->_data[$key];
                    }
                    break;
                case Cache::TYPE_MEMCACHE :
                    if ($memcache = self::getMemcache()) {
                        return $memcache->get($key);
                    } else {
                        return false;
                    }
                    break;
            }

            return null;
        }

        /**
         * Set item to cache
         * @param string $key
         * @param mixed $value
         * @param int $storage (OPTIONAL)
         * @return mixed $value
         * @static
         */
        public static function set($key, $value, $storage = Cache::TYPE_DEFAULT) {
            return self::getInstance()->setData($key, $value, $storage);
        }

        /**
         * Set item to cache
         * @param string $key
         * @param mixed $value
         * @param int $storage (OPTIONAL)
         * @return mixed $value
         * @static
         */
        public static function append($key, $value, $storage = Cache::TYPE_DEFAULT) {
            return self::getInstance()->appendData($key, $value, $storage);
        }

        /**
         * Get item from cache
         * @param string $key
         * @param int $storage (OPTIONAL)
         * @return mixed $value
         * @static
         */
        public static function get($key, $storage = Cache::TYPE_DEFAULT) {
            return self::getInstance()->getData($key, $storage);
        }
    }
