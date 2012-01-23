<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Class for handling messages
      * @name $application
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      */
    class Application {
        protected $message;
        protected $result;

        /**
          * Init application
          */
        public static function init() {
            // init sef to parse request string
            Sef::init();
            
            // log request
            $database = Database::getInstance();
            $system = System::getInstance();

            // compile log data and add to DB
            $module = substr($system->getCmd('module'), 0, 50);
            $action = substr($system->getCmd('action'), 0, 50);
            $task   = substr($system->getCmd('task'), 0, 50);
            $id     = substr($system->getCmd('id'), 0, 50);

            $ip      = substr($system->getUserIp(), 0, 50);
            $browser = substr($system->getUserBrowser(), 0, 255);
            $referer = substr($system->getReferer(), 0, 500);

            $query = "INSERT DELAYED INTO `#__logstat` 
                (`module`, `action`, `task`, `refid`, `ip`, `browser`, `referer`, `sessionid`) 
                VALUES ('$module', '$action', '$task', '$id', '$ip', '$browser', '$referer', '".session_id()."')";
            $result = $database->query($query);
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
          * @todo add save to log by error levels
          * @param string $error_msg error message
          * @param int $error_num OPTIONAL error number (default WARNING)
          * @param int $result OPTIONAL last result number (default 0)
          * @param bool $log OPTIONAL save to log file (default true)
          * @return bool FALSE
          */
        protected function _throw($message, $level = WARNING, $result = 0, $log = true) {
            // check empty message
            if (empty($message)) return false;
            
            // add message to global error stack
            $this->addToStack(print_r(debug_backtrace()), $level);

            // set message to current object
            $this->message = $message;
            $this->result = $result;
            
            // log error
            // @todo: add log levels
            if ($log) {
                $this->logLastMessage();
            }
            
            return false;
        }

        /**
          * Clean errors stack and add message to messages stack
          * @param string $message OPTIONAL message to show (default null)
          * @param bool $log OPTIONAL save to log file (default false)
          * @return bool TRUE
          */
        protected function _clean($message = null, $log = false) {
            // add message to global messages stack
            if (!empty($message)) {
                $this->addToStack($message, MESSAGE);
            }

            // clean errors
            $this->message = '';
            $this->result = 1;
            
            // log error
            if ($log !== false) {
                $this->logLastMessage();
            }
            
            return true;
        }

        /**
          * Put to file last error record
          * @return bool $result write operation result
          */
        protected function logLastMessage() {
            // get last message from stack
            $message = $this->getLastFromStack();
            $msg = getErrorStringFromInt($message['level']) . '] ' . $message['message'] . NL;
            
            // return result
            return $this->saveToLog($msg);
        }
        
        /**
          * Put to file message
          * @return bool $result write operation result
          */
        public function saveToLog($msg) {
            // get config
            $config = System::getInstance()->getConfig();

            // get last message from stack
            $message = $this->getLastFromStack();
            
            $filename = convertOSPath($config['doc_root'].$config['error_log']);
            $string = '[' . date('D M d H:i:s Y') . '] '
                    . $msg . NL;
            
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
          * @param string $error_msg error message
          * @param int $error_num OPTIONAL error level (default WARNING)
          * @return int $index index of inserted item
          */
        public function addToStack($message, $level = WARNING){
            // check stack
            if (empty($GLOBALS['stack'])) $GLOBALS['stack'] = array();

            // add object
            return array_unshift($GLOBALS['stack'], array(
                'message' => $message,
                'level' => $level
            ));
        }

        /**
          * Return messages stack
          * @return array $stack messages stack
          */
        public function getStack() {
            return (isset($GLOBALS['stack']) ? $GLOBALS['stack'] : array());
        }

        /**
          * Get last message from stack
          * @return string $message last message from stack
          */
        public function getLastFromStack() {
            if (empty($GLOBALS['stack'])) $GLOBALS['stack'] = array();
            return (count($GLOBALS['stack']) > 0 ? $GLOBALS['stack'][0] : false);
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
    }
