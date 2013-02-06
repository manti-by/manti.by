<?php
    /**
     * File control helper
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class File extends Control {

        protected $_selected = array();
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
         * @return bool|string
         */
        public static function getHtml($json, $type = null) {
            $result = '';
            $files = json_decode($json);
            if (is_array($files)) {
                foreach ($files as $file) {
                    switch ($type) {
                        case FileEntity::TYPE_PREVIEW:
                            $result .= '<audio controls><source src="' . Application::$config['http_host'] . substr($file->source, 1) . '" type="audio/mpeg;"></audio>';
                            break;
                        case FileEntity::TYPE_COVERS:
                            $result .= '<img src="' . Application::$config['http_host'] . substr($file->source, 1) . '" class="cover" />';
                            break;
                        case FileEntity::TYPE_RELEASE:
                        default:
                            $result .= '<a href="' . Application::$config['http_host'] . substr($file->source, 1) . '" class="release">' . T('Download') . '</a>';
                            break;
                    }
                }
            } else {
                return self::getInstance()->_throw(T('Incorect JSON data for tags'), MESSAGE);
            }

            return $result;
        }
    }
