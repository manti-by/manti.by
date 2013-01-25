<?php
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

        const TYPE_DEFAULT = 1;

        const TYPE_SESSION = 1;
        const TYPE_MEMORY  = 2;

        private $_data = array();
        protected static $instance = null;

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
         * Set data to storage
         * @param string $key
         * @param mixed $value
         * @param int $storage (OPTIONAL)
         * @return mixed $value
         */
        public function setData($key, $value, $storage) {
            switch ($storage) {
                case Cache::TYPE_SESSION:
                    $_SESSION[$key] = $value;
                    break;
                case Cache::TYPE_MEMORY :
                    $this->_data[$key] = $value;
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
        public function appendData($key, $value, $storage) {
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
            }

            return $value;
        }

        /**
         * Get data from storage
         * @param string $key
         * @param int $storage (OPTIONAL)
         * @return mixed|null $value
         */
        public function getData($key, $storage) {
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
