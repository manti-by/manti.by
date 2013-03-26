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
     * File control helper
     * @package M2 Micro Framework
     * @subpackage Controls
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class File extends Control {

        /**
         * @var array $_selected list of selected elements
         */
        protected $_selected = array();

        /**
         * @var string $_main_field field for
         */
        protected $_main_field = 'source';

        /**
         * Class constructor
         * @param mixed $value (optional)
         * @param mixed $options (optional)
         */
        public function __construct($value = null, $options = null) {
            parent::__construct($value, $options);

            // Set file type
            if (isset($options['type'])) {
                $this->_options['type'] = $options['type'];
            }
        }

        /**
         * Return HTML markup for control
         * @return bool|string
         */
        public function render() {
            $html = parent::render();
            if (!empty($html)) {
                $this->_data = Model::getModel('file')->getApproved($this->_options['type']);
                if ($this->_data) {
                    ob_start();
                    ?>
                        <script type="text/javascript">
                            $(document).ready(function() {
                                var file_id     = '<?php echo $this->_options['id']; ?>';
                                var file_class  = '<?php echo $this->_options['class']; ?>';
                                var file_name   = '<?php echo $this->_options['name']; ?>';

                                $('#' + file_id + '-edit').click(function(e) {
                                    $('#' + file_id + '-data').css('left', e.pageX).css('top', e.pageY).show();
                                });

                                $('.' + file_class).click(function() {
                                    var file_ids = [];
                                    $('.' + file_class + ':checked').each(function() {
                                        file_ids.push($(this).val());
                                    });
                                    $('#' + file_id).val(file_ids.join(','));
                                    $('#' + file_id + '-notice span').html(file_ids.length);
                                });
                            });
                        </script>

                        <div class="<?php echo $this->_options['class']; ?> file-control">
                            <input type="hidden" name="<?php echo $this->_options['name']; ?>" id="<?php echo $this->_options['id']; ?>" value="<?php echo $this->getValue('id'); ?>" />
                            <div id="<?php echo $this->_options['id']; ?>-notice">
                                <span class="bold"><?php echo count($this->_value); ?></span>/<?php echo count($this->_data); ?> <?php echo T('items'); ?>
                                <input type="button" name="<?php echo $this->_options['name']; ?>-edit" id="<?php echo $this->_options['id']; ?>-edit" class="file-edit" value="<?php echo T('Edit'); ?>" />
                            </div>
                            <div id="<?php echo $this->_options['id']; ?>-data" class="hidden popup">
                                <div class="hide_this">[X] <?php echo T('Close'); ?></div>
                                <div class="content">
                                    <ul>
                                        <?php foreach ($this->_data as $id => $label) : ?>
                                        <li>
                                            <input type="checkbox" name="<?php echo $this->_options['name']; ?>-items" class="<?php echo $this->_options['class']; ?>" value="<?php echo $id; ?>" <?php if (in_array($id, explode(',', $this->getValue('id')))) echo 'checked="checked"'; ?>/>
                                            <?php echo $label; ?>
                                        </li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    <?php
                    $html = ob_get_contents();
                    ob_end_clean();

                    return $html;
                } else {
                    return '<div id="' . $this->_options['id'] . '" class="' . $this->_options['class'] . ' files">'.T('No files found') .'</div>';
                }
            } else {
                return false;
            }
        }

        /**
         * Return html markup for json tags data
         * @static
         * @param string $json
         * @param string $type OPTIONAL
         * @param bool $multiple OPTIONAL false
         * @return bool|string
         * @todo Add implementation for multiple items
         */
        public static function getHtml($json, $type = null, $multiple = false) {
            $result = '';
            $files = json_decode($json);
            if (is_array($files)) {
                foreach ($files as $file) {
                    switch ($type) {
                        case FileEntity::TYPE_PREVIEW:
                            $result .= '<audio controls>';

                            // Default MP3 preview file
                            $mp3_preview = Application::$config['http_host'] . substr($file->source, 1);
                            $result .= '<source src="' . $mp3_preview . '" type="audio/mpeg">';

                            // Add Mozilla OGG support
                            $ogg_preview = str_replace('.mp3', '.ogg', $mp3_preview);
                            $result .= '<source src="' . $ogg_preview . '" type="audio/ogg">';

                            // Message for not supported browsers
                            $result .= '<span class="red">' . T('Your browser did not supported audio tag. Please update your browser.') . '</span>';
                            $result .= '</audio>';
                            break;
                        case FileEntity::TYPE_COVERS:
                            $result .= '<img src="' . Application::$config['http_host'] . substr($file->source, 1) . '" class="cover" />';
                            break;
                        case FileEntity::TYPE_RELEASE:
                        default:
                            $result .= '<a href="' . Application::$config['http_host'] . substr($file->source, 1) . '" class="release" rel="' . $file->id . '">' . T('Download') . '</a>';
                            break;
                    }

                    // Check for multiple sources
                    if (!$multiple) break;
                }
            } else {
                return self::getInstance()->_throw(T('Incorect JSON data for tags'), MESSAGE);
            }

            return $result;
        }
    }
