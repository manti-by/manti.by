<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Base inherited application class
     * @name $application
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     */
    class Application {

        public static $config = array();
        protected static $instance = null;

        protected $message = null;
        protected $result = 0;

        /**
         * Init application
         * Get parse current route
         * Get global user params
         * Save stats into DB
         */
        public static function init() {
            // Parse application config
            if (!self::parseConfig()) {
                die('Configuration error');
            }

            // Init sef to parse request string
            Sef::init();

            // Get system metrics
            $module = substr(System::getInstance()->getCmd('module'), 0, 50);
            $action = substr(System::getInstance()->getCmd('action'), 0, 50);
            $task   = substr(System::getInstance()->getCmd('task'), 0, 50);
            $id     = substr(System::getInstance()->getCmd('id'), 0, 50);

            // Get user metrics
            $ip      = substr(UserEntity::getIp(), 0, 50);
            $browser = substr(UserEntity::getUserAgent(), 0, 255);
            $referer = substr(UserEntity::getReferer(), 0, 500);

            // Save request log into db
            $query = "INSERT DELAYED INTO `#___log`
                    (`module`, `action`, `task`, `refid`, `ip`, `browser`, `referer`, `sessionid`)
                    VALUES ('$module', '$action', '$task', '$id', '$ip', '$browser', '$referer', '".session_id()."')";

            Database::getInstance()->query($query);
        }

        /**
         * Parse config from Application INI file
         * @return bool $state
         */
        public static function parseConfig() {
            // Parse config file
            $config = parse_ini_file(realpath(LIB_PATH . DS . 'config.ini'));

            if (!empty($config)) {
                // Parse config to object
                foreach ($config as $key => $value) {
                    Application::$config[$key] = $value;
                }

                // Define http_host & doc_root if empty
                if (empty(Application::$config['http_host'])) {
                    Application::$config['http_host']  = 'http://' . $_SERVER['HTTP_HOST'];
                }

                if (empty(Application::$config['doc_root'])) {
                    Application::$config['doc_root']   = ROOT_PATH;
                }

                return true;
            } else {
                return false;
            }
        }

        /**
         * Clean all stacks
         */
        public static function clean() {
            unset($GLOBALS['stack']);
            return;
        }

        /**
         * Close application
         */
        public static function shutdown() {
            Database::getInstance()->close();
            self::clean();
            die;
        }

        /**
         * Get last error message
         * @return string $error error message
         */
        public function getMessage() {
            return $this->message;
        }

        /**
         * Get last result number
         * if $count < 0, we have error
         * @return int $count count returned or updated rows
         */
        public function getResult() {
            return $this->result;
        }

        /**
         * Throw error and add message to error stack
         * @param string $message error message
         * @param int $level OPTIONAL error number
         * @return bool FALSE
         */
        protected function _throw($message, $level = null) {
            // Check default message level
            if (empty($level)) $level = self::$config['default_error_level'];

            // Check empty message
            if (empty($message)) return false;

            // Add message to global error stack
            $this->addToStack($message, $level);

            // Set message to current object
            $this->message = $message;
            $this->result = 0;

            // Log error
            if ($level >= self::$config['log_write_level']) {
                $this->saveToLog();
            }

            return false;
        }

        /**
         * Clean errors stack and add message to messages stack
         * @param string $message OPTIONAL message to show (default null)
         * @return bool TRUE
         */
        protected function _clean($message = null) {
            // Add message to global messages stack
            if (!empty($message)) {
                $this->addToStack($message, MESSAGE);
            }

            // Clean errors
            $this->message = null;
            $this->result = 1;

            // Log error
            if (MESSAGE >= self::$config['log_write_level']) {
                $this->saveToLog();
            }

            return true;
        }

        /**
         * Put into log file current message
         * @param string $message OPTIONAL if not set log last from stack
         * @return bool $result write operation result
         */
        public function saveToLog($message = null) {
            // Trying to get last message from stack
            if (empty($message)) {
                $message = $this->getLastFromStack();
                if (!$message) return false;

                $message = $message['level'] . ': ' . $message['message'] . ' (' . $message['debug'] . ')';
            }

            $filename = realpath(ROOT_PATH . DS . self::$config['error_log']);
            $string = '[' . date('D M d H:i:s Y') . '] ' . $message . NL;

            if (is_writable($filename)) {
                $handle = fopen($filename, 'a+');
                if (!$handle) return false;
                if (!fwrite($handle, $string)) return false;
                fclose($handle);
            } else {
                $handle = fopen($filename, 'w');
                if (!$handle) return false;
                if (!fwrite($handle, $string)) return false;
                fclose($handle);
            }
            return true;
        }

        /**
         * Put message to error stack
         * @param string $message error message
         * @param int $level OPTIONAL error level (default WARNING)
         * @return int $index index of inserted item
         */
        public function addToStack($message, $level = WARNING){
            // Compile debug info
            $debug = debug_backtrace();
            $debug_info = array();
            $skip = 0; $max = 0;
            foreach ($debug as $item) {
                if ($skip >= self::$config['debug_level_skip']) {
                    $debug_info[] =
                        $item['class'] . '->' .
                        $item['function'] . ' in ' .
                        str_replace(self::$config['doc_root'], '', $item['file']) . ':' .
                        $item['line'];
                }

                // Check debug depth
                if ($max >= self::$config['debug_level_max']) {
                    break;
                } else {
                    $skip++; $max++;
                }
            }

            // Check stack
            if (!isset($GLOBALS['stack'])) $GLOBALS['stack'] = array();

            // Update stack
            if (is_array($GLOBALS['stack'])) {
                $GLOBALS['stack'][] = array(
                    'message'   => $message,
                    'level'     => getErrorStringFromInt($level),
                    'debug'     => implode('; ', array_reverse($debug_info))
                );
            } else {
                $GLOBALS['stack'] = array(
                    array(
                    'message'   => $message,
                    'level'     => getErrorStringFromInt($level),
                    'debug'     => implode('; ', array_reverse($debug_info))
                ));
            }

            return $GLOBALS['stack'];
        }

        /**
         * Return messages stack
         * @return array $stack messages stack
         */
        public function getStack() {
            return (isset($GLOBALS['stack']) ? array_reverse($GLOBALS['stack']) : array());
        }

        /**
         * Get last message from stack
         * @return string $message last message from stack
         */
        public function getLastFromStack() {
            if (empty($GLOBALS['stack'])) $GLOBALS['stack'] = array();
            return (count($GLOBALS['stack']) > 0 ? reset($GLOBALS['stack']) : false);
        }

        /**
         * Check error stack
         * @return bool $state TRUE - if we have errors, FALSE otherwise
         */
        public function isMessagePresent() {
            if (empty($GLOBALS['stack'])) {
                return false;
            } else {
                return true;
            }
        }
    }