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
     * Base inherited application class
     * @name $application
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @since 0.1
     */
    class Application {

        /**
         * @var array $config app configuration
         */
        public static $config = array();

        /**
         * @var object $instance self pointer
         */
        protected static $instance = null;

        /**
         * @var array $message latest message from stack
         */
        protected $message = null;

        /**
         * @var int $result of the latest operation
         */
        protected $result = 0;

        /**
         * Singleton protection
         */
        protected function __construct() { }

        /**
         * GetInstance class method
         * @return Application $instance
         */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new Application;
            }
            return self::$instance;
        }

        /**
         * Init application
         * Get parse current route
         * Get global user params
         * Save stats into DB
         */
        public static function init() {
            ob_start();

            // Parse application config
            $error = false;
            if (!self::parseConfig()) {
                $error = T('Configuration error');
            }

            // Init sef to parse request string
            Sef::init();

            // Clean output buffer, show error message and die
            ob_end_clean();
            if (!empty($error)) {
                die($error);
            }
        }

        /**
         * Save to log input parameters
         */
        private static function saveLogData() {
            // Get system metrics
            $module = substr(System::getInstance()->getCmd('module'), 0, 50);
            $action = substr(System::getInstance()->getCmd('action'), 0, 50);
            $task   = substr(System::getInstance()->getCmd('task'), 0, 50);
            $id     = substr(System::getInstance()->getCmd('id'), 0, 50);

            // Get user metrics
            $ip      = substr(UserEntity::getIp(), 0, 50);
            $browser = substr(UserEntity::getUserAgent(), 0, 255);
            $referrer = substr(UserEntity::getReferer(), 0, 500);

            // Save request log into db
            $query = "INSERT INTO `#___log`
                    (`module`, `action`, `task`, `refid`, `ip`, `browser`, `referer`, `sessionid`)
                    VALUES ('$module', '$action', '$task', '$id', '$ip', '$browser', '$referrer', '".session_id()."')";

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

                // Check cookie language
                if (!empty($_COOKIE['language'])) {
                    Application::$config['language'] = $_COOKIE['language'];
                }

                // Define helper options
                if (empty(Application::$config['template_image_url_path'])) {
                    Application::$config['template_image_url_path'] = Application::$config['http_host'] . '/templates/' . Application::$config['template'] . '/images/';
                }

                // Check debug token
                $debug = System::getInstance()->getCmd('debug');
                if (!empty($debug)) {
                    Application::$config['show_debug_panel'] = true;
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
            unset($GLOBALS['sql']);
            return;
        }

        /**
         * Close application
         */
        public static function shutdown() {
            // Save to DB input data
            // and flush translation tokens into files
            self::saveLogData();
            self::flushTranslations();

            // Close DB connection and clean stacks
            Database::getInstance()->close();
            self::clean();
            die;
        }

        /**
         * Close application
         */
        public static function flushTranslations() {
            $language = (isset($_COOKIE['language']) ? $_COOKIE['language'] : 'en');
            $current = Cache::get('translations_' . $language);

            $lang_file = ROOT_PATH . DS . 'language' . DS . $language . '.ini';
            if (file_exists($lang_file)) {
                $exist = parse_ini_file($lang_file);
            }

            $new = array_diff_key($current, $exist);
            $handler = fopen($lang_file, 'a');
            foreach ($new as $key => $value) {
                fwrite($handler, $key . ' = "' . $value . '"' . NL);
            }
            fclose($handler);
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
        public function _throw($message, $level = null) {
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
            if ($level <= self::$config['log_write_level']) {
                $this->saveToLog();
            }

            return false;
        }

        /**
         * Clean errors stack and add message to messages stack
         * @param string $message OPTIONAL message to show (default null)
         * @return bool TRUE
         */
        public function _clean($message = null) {
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
                if (!$message = $this->getLastFromStack()) return false;
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
            return (isset($GLOBALS['stack']) ? $GLOBALS['stack'] : array());
        }

        /**
         * Put SQL query to query queue
         * @param string $query SQL query
         * @return bool $result
         */
        public function logSQL($query){
            // Check stack
            if (!isset($GLOBALS['sql'])) $GLOBALS['sql'] = array();

            // Clean query
            $query = explode(PHP_EOL, $query);
            $result = array();
            foreach ($query as $line) {
                if (!empty($line)) {
                    if (strlen($line) <= 120) $result[] = trim($line);
                    else $result[] = substr(trim($line), 0, 120) . ' [...]';
                }
            }
            $query = implode(PHP_EOL, $result);

            // Update stack
            if (is_array($GLOBALS['sql'])) {
                $GLOBALS['sql'][] = $query;
            } else {
                $GLOBALS['sql'] = array($query);
            }

            return $GLOBALS['sql'];
        }

        /**
         * Get SQL queue
         * @return array $sql sql stack
         */
        public function getSQL(){
            return (isset($GLOBALS['sql']) ? $GLOBALS['sql'] : array());
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