<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * @desc View class
      * @name $view
      * @package M2 Micro Framework
      * @subpackage Modules
      * @author Alexander Chaika
      */
    class View extends Application {
        
        /**
          * View class constructor
          */
        public function __construct() {
            $this->config = System::getInstance()->getConfig();
        }
        
        /**
          * Render action
          * @param array $options
          */
        public function render($options = null) {
            // check empty format
            if (empty($options) && !isset($options['format'])) {
                $options = array('format' => 'page');
            }            
            
            // route output
            switch ($options['format']) {
                case 'html':
                    // set headers
                    header('HTTP/1.1 200 OK');
                    header('Content-Type: text/html; charset=UTF-8');
                    header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
                    header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
                    header('Cache-Control: no-cache, must-revalidate');
                    header('Pragma: no-cache');
                    
                    // output html data
                    echo $options['data'];
                    break;
                default:
                case 'page':
                    // set headers
                    header('HTTP/1.1 200 OK');
                    header('Content-Type: text/html; charset=UTF-8');
                    header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
                    header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
                    header('Cache-Control: no-cache, must-revalidate');
                    header('Pragma: no-cache');
                    
                    // output html data
                    echo $this->wrapPage($options);
                    break;
                case 'log':
                    // Add log record
                    $this->saveToLog($options['data']);
                break;
            }
            return;
        }
        
        /**
          * Wrap HTML data to Page
          * @param array $options
          * @return string $html
          */
        public function wrapPage($options) {
            // get form contents
            return $this->getContents(null, 'index', $options, false);
        }
        
        /**
          * Get HTML contents for TYPE/NAME entity
          * @param array $options
          * @param bool $mode OPTIONAL if true - template view
          * @return string $html
          */
        public function getContents($type, $name, $options = null, $view = true) {
            // get content type
            $type = (!empty($type) ? $type . DS : '');
            $name = (!empty($name) ? $name : 'index');
            
            // compile template prefix and postfix
            $prefix = $this->config['doc_root'] . DS . 'templates' . DS;
            if ($view) {
                $postfix = DS . 'view' . DS . $type . $name . '.php';
            } else {
                $postfix = DS . $type . $name . '.php';
            }
            
            // check content file existance
            $content_file_name = convertOSPath($prefix . $options['template'] . $postfix);
            if (!file_exists($content_file_name)) {
                // check default template for view
                $content_file_name = convertOSPath($prefix . $this->config['template'] . $postfix);
                if (!file_exists($content_file_name)) {
                    $content_file = array(
                        (!empty($options['template']) ? $options['template'] : $this->config['template']),
                        (!empty($type) ? $options['type'] : 'none'),
                        (!empty($options['name']) ? $options['name'] : 'Undefined')
                    );
                    return $this->_throw('Template file for ' . implode('/', $content_file) . ' not found');
                }
            }
            
            // render to buffer
            ob_start();

            // get contents
            include $content_file_name;
            $result = ob_get_contents();

            // clean buffer
            ob_end_clean();

            return $result;
        }
        
        /**
          * Offline render action
          * @param array $options OPTIONAL
          */
        public function offline($options = null) {
            $message = $this->getLastFromStack();
            echo '<code>['.getErrorStringFromInt($message['level']).']'.$message['message'].'</code>';
            echo '<code>['.var_dump(debug_backtrace()).'</code>';
            return;
        }
    }
