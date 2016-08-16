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

    use OpenCV\Image as Image;
    use OpenCV\Histogram as Histogram;

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

        const RESIZE_WITH_RATIO = 0; // Resize with aspect ratio
        const RESIZE_WITH_CROP  = 1; // Resize to square and crop excess
        const RESIZE_HEAD_ON    = 2; // Resize and crop excess header and footer
        const RESIZE_FACE_DETECT= 3; // Resize and crop with face detection
        const RESIZE_EXACT      = 4; // Resize to exact size

        /**
         * @var object $instance self pointer
         */
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
         * @param int $mode
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

            // Check resource
            if (!$swidth || !$sheight) {
                return $this->_throw('Please check preview image settings');
            }

            try {
                // Check if dest dimensions larger than source
                $is_check_face = false;
                if (($width < $swidth) || ($height < $sheight)) {
                    if ($mode == System::RESIZE_WITH_RATIO) { // save aspect ratio
                        $ratiox = $swidth / $width;
                        $ratioy = $sheight / $height;

                        if ($ratiox < $ratioy) {
                            $dwidth  = $swidth / $ratioy;
                            $dheight = $height;
                        } else {
                            $dwidth  = $width;
                            $dheight = $sheight / $ratiox;
                        }
                    } elseif ($mode == System::RESIZE_WITH_CROP) {
                        if ($swidth > $sheight) {
                            $dwidth  = $height;
                            $dheight = $height;
                        } else {
                            $dwidth  = $width;
                            $dheight = $width;
                        }
                    } elseif ($mode == System::RESIZE_HEAD_ON || $mode == System::RESIZE_FACE_DETECT) {
                        $dwidth  = $width;
                        $dheight = $width * $sheight / $swidth;
                    } else {
                        $dwidth  = $width;
                        $dheight = $height;
                    }

                    // Create destination resource
                    if (function_exists("imagecreatetruecolor")) {
                        $dest = imagecreatetruecolor((int)$dwidth, (int)$dheight);
                    } else {
                        $dest = imagecreate((int)$dwidth, (int)$dheight);
                    }

                    // Check resource
                    if (!$dest) {
                        return $this->_throw('Cant create image resource, please check environment');
                    }

                    // Set background to white
                    $white = imagecolorallocate($dest, 255, 255, 255);
                    imagefill($dest, 0, 0, $white);

                    // Create destination image
                    $function = function_exists("imagecopyresampled") ? 'imagecopyresampled' : 'imagecopyresized';
                    if ($mode == System::RESIZE_WITH_CROP) {
                        if ($swidth > $sheight) {
                            $shift = ($swidth - $sheight) / 2;
                            call_user_func($function, $dest, $source, 0, 0, $shift, 0,
                                (int)$dwidth, (int)$dheight, $sheight, $sheight);
                        } else {
                            $shift = ($sheight - $swidth) / 2;
                            call_user_func($function, $dest, $source, 0, 0, 0, $shift,
                                (int)$dwidth, (int)$dheight, $swidth, $swidth);
                        }
                    } elseif ($mode == System::RESIZE_HEAD_ON) {
                        $shift = ($height - $dheight) / 2;
                        call_user_func($function, $dest, $source, 0, $shift, 0, 0,
                            (int)$dwidth, (int)$dheight, $swidth, $sheight);

                        $dest = imagecrop($dest,
                            array('x' => 0, 'y' => 0, 'width' => $width, 'height' => $height));
                    } elseif ($mode == System::RESIZE_FACE_DETECT) {
                        if ($sheight > $swidth) {
                            echo 'Try to detect face at image ' . $sname . NL;
                            $face_rectangle = System::getFaceRectangle($sname);
                        }

                        if (isset($face_rectangle['y'])) {
                            echo 'Face detected at ' . $face_rectangle['x'] . ':' . $face_rectangle['y'] . NL;
                            $shift = $face_rectangle['y'] + ($face_rectangle['height'] / 2) - $dheight;
                            $shift = $shift > 0 ? $shift : 0;
                        } else {
                            $shift = ($height - $dheight) / 2;
                        }
                        call_user_func($function, $dest, $source, 0, $shift, 0, 0,
                            (int)$dwidth, (int)$dheight, $swidth, $sheight);

                        $dest = imagecrop($dest,
                            array('x' => 0, 'y' => 0, 'width' => $width, 'height' => $height));
                    } else {
                        call_user_func($function, $dest, $source, 0, 0, 0, 0,
                            (int)$dwidth, (int)$dheight, $swidth, $swidth);
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
         * Add waterwark to image
         * @param string $source path to file
         * @param string $watermark path to watermark
         * @param int $shift_x horizontal shift
         * @param int $shift_y vertical shift
         * @param bool $is_bottom place to bottom of image corner
         * @param bool $is_right place to right of image corner
         * @return array|bool
         */
        public function addWatermark($source, $watermark, $shift_x = 10, $shift_y = 10, $is_bottom = true, $is_right = true) {
            // Create source
            $result = array('type' => str_replace('.', '', strtolower(strrchr($source, '.'))));
            switch ($result['type']) {
                case 'jpg':
                    $source = imagecreatefromjpeg($source);
                    break;
                case 'gif':
                    $source = imagecreatefromgif($source);
                    break;
                case 'png':
                    $source = imagecreatefrompng($source);
                    break;
                default:
                    return $this->_throw(T('This is not an image') . ': ' . $source);
            }

            // Create watermark
            switch (str_replace('.', '', strtolower(strrchr($watermark, '.')))) {
                case 'jpg':
                    $watermark = imagecreatefromjpeg($watermark);
                    break;
                case 'gif':
                    $watermark = imagecreatefromgif($watermark);
                    break;
                case 'png':
                    $watermark = imagecreatefrompng($watermark);
                    break;
                default:
                    return $this->_throw(T('This is not an image') . ': ' . $watermark);
            }

            // Get dimensions
            $watermark_width  = imagesx($watermark);
            $watermark_height = imagesy($watermark);

            $source_x = $is_right ? imagesx($source) - $shift_x - $watermark_width : $shift_x;
            $source_y = $is_bottom ? imagesy($source) - $shift_y - $watermark_height : $shift_y;

            // Copy watermark and create output
            imagecopy($source, $watermark, $source_x, $source_y, 0, 0, $watermark_width, $watermark_height);

            ob_start();
            switch ($result['type']) {
                case 'jpg':
                    imagejpeg($source);
                    break;
                case 'gif':
                    imagegif($source);
                    break;
                case 'png':
                    imagepng($source);
                    break;
            }
            $result['data'] = ob_get_contents();
            ob_end_clean();

            return $result;
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
         * @return array|false $domain parts
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
         * Get ip country
         * @param string $ip
         * @return string $country
         */
        public static function getCountry($ip) {
            // Open CURL session
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_FAILONERROR, 1);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);

            // Get coords
            $url = 'http://api.ipinfodb.com/v3/ip-country/?key=' . Application::$config['ipinfo_key'] . '&ip='.urlencode($ip);
            curl_setopt($curl, CURLOPT_URL, $url); // set url to post to
            $result = trim(curl_exec($curl)); // run the whole process

            // Close CURL
            curl_close($curl);

            // Return only ISO2
            $result = explode(';', $result);
            return $result[3] == '-' ? 'XX' : $result[3];
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

        public static function sortBySquare($a, $b)
        {
            if ($a['width'] * $a['height'] == $b['width'] * $b['height']) {
                return 0;
            }
            return $a['width'] * $a['height'] > $b['width'] * $b['height'] ? 1 : -1;
        }

        /**
         * Face detection tool using OpenCV library
         * @param string $image
         * @return array $result
         */
        public static function getFaceRectangle($image) {
            $i = Image::load($image, Image::LOAD_IMAGE_COLOR);
            $result = $i->haarDetectObjects("/usr/share/opencv/haarcascades/haarcascade_frontalface_default.xml");

            usort($result, array('self', 'sortBySquare'));
            return reset($result);
        }
    }