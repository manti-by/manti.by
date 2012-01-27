<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Class for system operations
      * NOTICE: This class implemented as Singleton
      * @name $system
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      * @version 1.0
      */
    class System extends Application {
        // system config
        private $config;

        protected static $instance = null;

        /**
          * Singleton protection
          */
        private function __construct() {
            // parse config file
            $this->parseConfig();
        }
        private function __clone() {}
        private function __wakeup() {}
    
        /**
          * GetInstance class method
          * @return object $instance
          */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new System;
            }
            return self::$instance;
        }
        
        /**
          * Get Server config
          * @return array $config server params
          */
        public function getConfig() {
            // global config
            if (empty($this->config)) {
                $this->parseConfig();
            }

            return $this->config;
        }
        
        /**
          * Set Server config
          * @param array $config server params
          */
        public function setConfig($config) {
            // global config
            $this->config = $config;
        }
        
        /**
          * Set/Get config param
          * @param string $name
          * @param mixed $value OPTIONAL (!NOT null)
          * @return mixed $value
          */
        public function configAttr($name, $value = null) {
            // set new value if present
            if ($value !== null) {
                $this->config[$name] = $value;
            }
            
            return $this->config[$name];
        }

        /**
          * Get variable from Request or upload file and return uploaded file name
          * @param string $param name of requested variable
          * @param mixed $default optional default value if not exist
          * @param mixed $upload_path optional upload path if file
          * @return mixed $value value or uploaded file name
          */
        public function getCmd($param, $default = null, $upload_path = null) {
            // process string params
            if (isset($_REQUEST[$param]) && !empty($_REQUEST[$param])) {
                if (!is_array($_REQUEST[$param])) {
                    return mysql_escape_string($_REQUEST[$param]);
                } else {
                    return array_map('mysql_escape_string', $_REQUEST[$param]);
                }
            }

            // process uploaded files
            if (isset($_FILES[$param]) && !empty($_FILES[$param])) {
                if (count($_FILES[$param]['tmp_name']) > 0) {
                    $default = array();
                    while (list($key, $value) = each($_FILES[$param]["name"])) {
                        if ($_FILES[$param]["error"][$key] > 0) {
                            $this->_throw(T('Error transfer file').' [' . $_FILES[$param]["name"][$key] . ']!') ;
                        } else {
                            $file_parts  = pathinfo($_FILES[$param]['name'][$key]);
                            $allowed_ext = explode(',', $this->config['allowed_file_extentions']);

                            // check file extension
                            if (in_array(strtolower($file_parts['extension']), $allowed_ext)) {
                                $temp_file   = $_FILES[$param]['tmp_name'][$key];
                                $upload_path = (!empty($upload_path) ? $upload_path : $this->config['upload_image_path']);
                                $target_path = $this->config['doc_root']. '/' . $upload_path . '/';

                                // generate unique name
                                $target_name = uniqid(time()) . '.' . $file_parts['extension'];
                                $target_file = str_replace('//', '/', $target_path) . $target_name;

                                // move file to storage
                                if (!move_uploaded_file($temp_file, $target_file)) {
                                    $this->_throw(T('File upload failed').' ['.$_FILES[$param]["name"][$key].']. '.T('Check permissions for writing'));
                                } else {
                                    $default[$_FILES[$param]["name"][$key]] = $target_name;
                                }
                            } else {
                                $this->_throw(T('Invalid file type').' ['.$_FILES[$param]['name'][$key].']!');
                            }
                        }
                    }
                    return $default;
                }
            }

            return $default;
        }

        /**
          * Send mail via standart PHP mailer
          * @param string $email send to
          * @param string $title title of message
          * @param string $description message body
          * @param string $attach OPTIONAL local file name for attachment
          * @return bool $state
          */
        public function mail($email, $title, $description, $attach = null) {
            // change line endings for html compliance
            $description = nl2br($description);
            
            // check email
            if ($this->isValidEmail($email)) {
                // mail headers & body
                if ($attach) {
                    $uid = strtoupper(uniqid(time()));
                    $headers  = "MIME-Version: 1.0\r\n";
                    $headers .= "X-Mailer: PHP/" . phpversion()."\n";
                    $headers .= "From: ".$config['mail_from']."\r\n";
                    $headers .= "Content-Type:multipart/mixed;";
                    $headers .= "boundary=\"----------".$uid."\"\n\n";

                    $desc  = "------------".$uid."\nContent-Type:text/html;\n";
                    $desc .= "Content-Transfer-Encoding: 8bit\n\n$description\n\n";
                    $desc .= "------------".$uid."\n";
                    $desc .= "Content-Type: application/octet-stream;";
                    $desc .= "name=\"".basename($attach)."\"\n";
                    $desc .= "Content-Transfer-Encoding:base64\n";
                    $desc .= "Content-Disposition:attachment;";
                    $desc .= "filename=\"".basename($attach)."\"\n\n";
                    $desc .= chunk_split(base64_encode(fread(fopen($attach, "rb"), filesize($attach))))."\n";
                } else {
                    $headers  = "MIME-Version: 1.0\r\n";
                    $headers .= "Content-type: text/html; charset=utf-8\r\n";
                    $headers .= "From: ".$config['mail_from']."\r\n";
                    $headers .= "X-Mailer: PHP/" . phpversion()."\n";

                    $desc = $description;
                }

                // try to send email
                try {
                    $result = mail($email, $title, $desc, $headers, '-f'.$this->config['mail_from']);

                    // send mail failed
                    if ($result) {
                        return $this->_clean();
                    } else {
                        return $this->_throw(T('Send email failed'));
                    }
                } catch(Exception $e) {
                    return $this->_throw($e->getMessage());
                }
            } else {
                return false;
            }
        }

        /**
          * Resize image
          * @todo This is function not tested properly!
          * @param string $sname source
          * @param string $dname destination
          * @param int $width width to resize
          * @param int $height height to resize
          * @param int $mode (optional: 0 - with aspect ratio, other - head-on)
          * @return bool $result
          */
        public function resize($sname, $dname, $width, $height, $mode = 0) {
            // create source
            switch (strtolower(strrchr($sname, '.'))) {
                case '.jpg':
                    $source = imagecreatefromjpeg($sname);
                    break;
                case '.gif':
                    $source = imagecreatefromgif($sname);
                    break;
                case '.png':
                    $source = imagecreatefrompng($sname);
                    break;
                default:
                    return $this->_throw(T('This is not an image'));
            }
            
            // get source dimensions
            $swidth = imagesx($source);
            $sheight = imagesy($source);

            try {
                // check if dest dimensions larger than source
                if (($width < $swidth) || ($height < $sheight)) {
                    if ($mode == 0) { // save aspect ratio
                        $ratiox = $swidth / $width;
                        $ratioy = $sheight / $height;

                        if ($ratiox < $ratioy) {
                            $dwidth  = intval($swidth / $ratioy);
                            $dheight = intval($height);
                        } else {
                            $dwidth  = intval($width);
                            $dheight = intval($sheight / $ratiox);
                        }
                    } else {
                        $dheight = $height;
                        $dwidth  = $width;
                    }

                    // create destination resource
                    if (function_exists("imagecreatetruecolor")) {
                        $dest = imagecreatetruecolor($dwidth, $dheight);
                    } else {
                        $dest = imagecreate($dwidth, $dheight);
                    }
                    
                    // create destination image
                    if (function_exists("imagecopyresampled")) {
                        imagecopyresampled($dest, $source, 0, 0, 0, 0, (int)$dwidth, (int)$dheight, $swidth, $sheight);
                    } else {
                        imagecopyresized($dest, $source, 0, 0, 0, 0, (int)$dwidth, (int)$dheight, $swidth, $sheight);
                    }

                    // destination file
                    imagejpeg($dest, $dname, 90); // max 100

                    // delete resources
                    imagedestroy($source);
                    imagedestroy($dest);
                } else {
                    // if dest dimensions larger than source
                    // simply copy source file
                    copy($sname, $dname);
                }
            } catch (Exception $e) {
                return $this->_throw($e->getMessage());
            }
            
            return $this->_clean();
        }


        /**
          * Email validation
          * @param string $email check if valid email address
          * @return bool $valid
          */
        public function isValidEmail($email) {
            $regexp = '/^[a-z_0-9\-\.]+@[a-z_0-9\-\.]+\.[a-z]{2,6}$/i';
            if (!preg_match($regexp, $email)) return $this->_throw(T('Invalid Email'));
            else return $this->_clean();
        }

        /**
          * Parse config from Application INI file
          * @return bool $state
          */
        public function parseConfig() {
            // parse config file
            $this->config = parse_ini_file('config.ini');

            if (!empty($this->config)) {
                // parse config to object
                foreach($this->config as $key => $value) {
                    $this->config[$key] = $value;
                }

                // define http_host & doc_root if empty
                if (empty($this->config['http_host'])) {
                    $this->config['http_host']  = 'http://' . $_SERVER['HTTP_HOST'];
                }

                if (empty($this->config['doc_root'])) {
                    $this->config['doc_root']   = DOC_ROOT;
                }

                return $this->_clean();
            } else {
                return $this->_throw(T('Could not parse config'), ERROR);
            }
        }
        
        /**
          * Redirect user to page
          * @param string $url OPTIONAL if empty redirect to home page (default null)
          */
        public function redirect($url = null) {
            // redirect to parent page or index
            if (empty($url)) {
                if (empty($_SESSION['redirect'])) {
                    header('Location: ' . $this->config['http_host']);
                } else {
                    $location = $_SESSION['redirect'];
                    $_SESSION['redirect'] = '';
                    header('Location: ' . $location);
                    
                }
            } else {
                header('Location: ' . $url);
            }
            die;
        }
        
        /**
          * Check if gzip enabled and work
          * @return bool $state
          */
        public function isGzip() {
            if (!$this->config['gzip']) return false;
            if (headers_sent() || connection_aborted()) return false;
            if (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip') !== false) return false; 
            if (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false) return false; 
            
            return true;
        }

        /**
          * Get coords from yamaps service
          * @param string $address
          * @return array $coords
          */
        public function getCoords($address) {
            // open CURL session
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_FAILONERROR, 1);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);

            // get coords
            $url = 'http://geocode-maps.yandex.ru/1.x/?geocode='.urlencode($address).'&key=APYbjEsBAAAAFD33IQIAua2B4OGy4WyH6KClVdNY3BiW1d8AAAAAAAAAAAA44Al198Kfb-CDGWSNujQ_AG6X8A==&format=json&results=1&plng=ru';
            curl_setopt($curl, CURLOPT_URL, $url); // set url to post to
            $result = json_decode(curl_exec($curl)); // run the whole process
            $coords = explode(' ', $result->response->GeoObjectCollection->featureMember[0]->GeoObject->Point->pos);
            
            // close CURL
            curl_close($curl);
            
            return $coords;
        }
    }
