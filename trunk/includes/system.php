<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Class for system operations
     * NOTICE: This class implemented as Singleton
     * @name $system
     * @package M2 Micro Framework
     * @subpackage Library
     * @author Alexander Chaika
     * @since 0.2RC1
     */
    class System extends Application {

        const RESIZE_WITH_RATIO = 0;
        const RESIZE_WITH_CROP  = 1;
        const RESIZE_HEAD_ON    = 2;

        protected static $instance = null;

        /**
         * Singleton protection
         */
        protected function __construct() { }

        /**
         * GetInstance class method
         * @return System $instance
         */
        public static function getInstance() {
            if (is_null(self::$instance)) {
                self::$instance = new System;
            }
            return self::$instance;
        }

        /**
         * Get variable from Request or upload file and return uploaded file name
         * @param string $param name of requested variable
         * @param mixed $default optional default value if not exist
         * @param mixed $upload_path optional upload path if file
         * @return mixed $value value or uploaded file name
         */
        public function getCmd($param, $default = null, $upload_path = null) {
            // Get DB instance for escaping
            $database = Database::getInstance();

            // Process string params
            if (isset($_REQUEST[$param]) && !empty($_REQUEST[$param])) {
                if (!is_array($_REQUEST[$param])) {
                    return $database->escape($_REQUEST[$param]);
                } else {
                    return array_map(array($database, 'escape'), $_REQUEST[$param]);
                }
            }

            // Process uploaded files
            if (isset($_FILES[$param]) && !empty($_FILES[$param])) {
                if (count($_FILES[$param]['tmp_name']) > 0) {
                    $default = array();
                    /** @noinspection PhpAssignmentInConditionInspection */
                    while (list($key, $filename) = each($_FILES[$param]["name"])) {
                        if ($_FILES[$param]["error"][$key] > 0) {
                            $this->_throw(T('Error transfer file').' [' . $filename . ']!') ;
                        } else {
                            $file_parts  = pathinfo($filename);
                            $allowed_ext = explode(',', Application::$config['allowed_file_extentions']);

                            // check file extension
                            if (in_array(strtolower($file_parts['extension']), $allowed_ext)) {
                                $temp_file   = $_FILES[$param]['tmp_name'][$key];
                                $upload_path = (!empty($upload_path) ? $upload_path : Application::$config['upload_image_path']);
                                $target_path = Application::$config['doc_root']. '/' . $upload_path . '/';

                                // generate unique name
                                $target_name = uniqid(time()) . '.' . $file_parts['extension'];
                                $target_file = str_replace('//', '/', $target_path) . $target_name;

                                // move file to storage
                                if (!move_uploaded_file($temp_file, $target_file)) {
                                    $this->_throw(T('File upload failed').' ['.$filename.']. '.T('Check permissions for writing'));
                                } else {
                                    $default[$filename] = $target_name;
                                }
                            } else {
                                $this->_throw(T('Invalid file type').' ['.$filename.']!');
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
            // Change line endings for html compliance
            $description = nl2br($description);

            // Check email
            if ($this->isValidEmail($email)) {
                // mail headers & body
                if ($attach) {
                    $uid = strtoupper(uniqid(time()));
                    $headers  = "MIME-Version: 1.0\r\n";
                    $headers .= "X-Mailer: PHP/" . phpversion()."\n";
                    $headers .= "From: ".Application::$config['mail_from']."\r\n";
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
                    $headers .= "From: ".Application::$config['mail_from']."\r\n";
                    $headers .= "X-Mailer: PHP/" . phpversion()."\n";

                    $desc = $description;
                }

                // Try to send email
                try {
                    $result = mail($email, $title, $desc, $headers, '-f'.Application::$config['mail_from']);

                    // Send mail failed
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
         * @param string $sname source
         * @param string $dname destination
         * @param int $width width to resize
         * @param int $height height to resize
         * @param int $mode (optional: 0 - with aspect ratio, 1 - crop, other - head-on)
         * @return bool $result
         */
        public function resize($sname, $dname, $width, $height, $mode = System::RESIZE_WITH_RATIO) {
            // Create source
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
                    return $this->_throw(T('This is not an image') . ': ' . $sname);
            }

            // Get source dimensions
            $swidth = imagesx($source);
            $sheight = imagesy($source);

            try {
                // Check if dest dimensions larger than source
                if (($width < $swidth) || ($height < $sheight)) {
                    if ($mode == System::RESIZE_WITH_RATIO) { // save aspect ratio
                        $ratiox = $swidth / $width;
                        $ratioy = $sheight / $height;

                        if ($ratiox < $ratioy) {
                            $dwidth  = intval($swidth / $ratioy);
                            $dheight = intval($height);
                        } else {
                            $dwidth  = intval($width);
                            $dheight = intval($sheight / $ratiox);
                        }
                    } elseif ($mode == System::RESIZE_WITH_CROP) {
                        if ($swidth > $sheight) {
                            $dwidth  = intval($height);
                            $dheight = intval($height);
                        } else {
                            $dwidth  = intval($width);
                            $dheight = intval($width);
                        }
                    } else {
                        $dheight = $height;
                        $dwidth  = $width;
                    }

                    // Create destination resource
                    if (function_exists("imagecreatetruecolor")) {
                        $dest = imagecreatetruecolor($dwidth, $dheight);
                    } else {
                        $dest = imagecreate($dwidth, $dheight);
                    }

                    // Create destination image
                    if (function_exists("imagecopyresampled")) {
                        if ($mode != System::RESIZE_WITH_CROP) {
                            imagecopyresampled($dest, $source, 0, 0, 0, 0, (int)$dwidth, (int)$dheight, $swidth, $sheight);
                        } else {
                            if ($swidth > $sheight) {
                                $shift = ($swidth - $sheight) / 2;
                                imagecopyresampled($dest, $source, 0, 0, $shift, 0, (int)$dwidth, (int)$dheight, $sheight, $sheight);
                            } else {
                                $shift = ($sheight - $swidth) / 2;
                                imagecopyresampled($dest, $source, 0, 0, 0, $shift, (int)$dwidth, (int)$dheight, $swidth, $swidth);
                            }
                        }
                    } else {
                        if ($mode != System::RESIZE_WITH_CROP) {
                            imagecopyresized($dest, $source, 0, 0, 0, 0, (int)$dwidth, (int)$dheight, $swidth, $sheight);
                        } else {
                            if ($swidth > $sheight) {
                                $shift = ($swidth - $sheight) / 2;
                                imagecopyresized($dest, $source, 0, 0, $shift, 0, (int)$dwidth, (int)$dheight, $sheight, $sheight);
                            } else {
                                $shift = ($sheight - $swidth) / 2;
                                imagecopyresized($dest, $source, 0, 0, 0, $shift, (int)$dwidth, (int)$dheight, $swidth, $swidth);
                            }
                        }
                    }

                    // Destination file
                    imagejpeg($dest, $dname, 90); // max 100

                    // Delete resources
                    imagedestroy($source);
                    imagedestroy($dest);
                } else {
                    // If dest dimensions larger than source
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
         * Redirect user to page
         * @param string $url OPTIONAL if empty redirect to home page (default null)
         * @param string $message OPTIONAL
         * @param bool $is_error OPTIONAL
         */
        public static function redirect($url = null, $message = null, $is_error = false) {
            // Set message if present
            if (!empty($message)) {
                $_SESSION['message'] = $message;
                $_SESSION['is_error'] = $is_error;
            }

            // Redirect to parent page or index
            if (empty($url)) {
                if (empty($_SESSION['redirect'])) {
                    header('Location: ' . Application::$config['http_host']);
                    header('Set-Cookie: PHPSESSID='.session_id().';expires='.date('r', time() + 60 * 30).';');
                } else {
                    $location = $_SESSION['redirect'];
                    unset($_SESSION['redirect']);

                    header('Location: ' . $location);
                    header('Set-Cookie: PHPSESSID='.session_id().';expires='.date('r', time() + 60 * 30).';');
                }
            } else {
                header('Location: ' . $url);
                header('Set-Cookie: PHPSESSID='.session_id().';expires='.date('r', time() + 60 * 30).';');
            }
            die;
        }

        /**
         * Get domain parts
         * @return array $domain parts
         */
        public function getDomainParts() {
            // Check domain
            if (empty(Application::$config['http_host'])) {
                return $this->_throw(T('Could not get current domain'), ERROR);
            }

            // Parse config
            $domain = explode('.', str_replace('http://', '', Application::$config['http_host']));
            if (count($domain) == 2) {
                $result['name'] = $domain[0];
                $result['zone'] = $domain[1];
            } else if (count($domain) == 3) {
                $result['subname'] = $domain[0];
                $result['name'] = $domain[1];
                $result['zone'] = $domain[2];
            } else if (count($domain) > 3) {
                $result['etc'] = array_slice($domain, 0, count($domain)-3);
                $result['subname'] = $domain[count($domain)-3];
                $result['name'] = $domain[count($domain)-2];
                $result['zone'] = $domain[count($domain)-1];
            } else {
                return $this->_throw(T('Invalid domain'));
            }

            return $result;
        }

        /**
         * Get 3th domain
         * @return string $domain
         */
        public function getSubDomain() {
            $domain = $this->getDomainParts();
            if (isset($domain['subname'])) {
                return $domain['subname'];
            } else {
                return false;
            }
        }

        /**
         * Check if gzip enabled and work
         * @return bool $state
         */
        public static function isGzip() {
            if (!Application::$config['gzip']) return false;
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
        public static function getCoords($address) {
            // Open CURL session
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_FAILONERROR, 1);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);

            // Get coords
            $url = 'http://geocode-maps.yandex.ru/1.x/?format=json&geocode='.urlencode($address);
            curl_setopt($curl, CURLOPT_URL, $url); // set url to post to
            $result = json_decode(curl_exec($curl)); // run the whole process
            $coords = explode(' ', $result->response->GeoObjectCollection->featureMember[0]->GeoObject->Point->pos);

            // Close CURL
            curl_close($curl);

            return $coords;
        }

        /**
         * Convert size in bytes to human readable
         * @param int $bytes
         * @param int $decimals OPTIONAL
         * @return string $result
         */
        public static function humanReadableFilesize($bytes, $decimals = 2) {
            $sizes = 'BKMGTP';
            $factor = (int)floor((strlen($bytes) - 1) / 3);
            return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . $sizes[$factor];
        }
    }