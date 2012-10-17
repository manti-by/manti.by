<?php
    /**
     * Relations control helper
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class Relations extends Control {

        /**
         * Return HTML markup for control
         * @return bool|string
         */
        public function render() {
            if ($html = parent::render()) {
                $this->_data = Model::getModel('blog')->getRelations($this->_options['reference_id']);
                if ($this->_data) {
                    ob_start();
                    ?>
                    <script type="text/javascript">
                        $(document).ready(function() {
                            var rel_id     = '<?php echo $this->_options['id']; ?>';
                            var rel_class  = '<?php echo $this->_options['class']; ?>';
                            var rel_name   = '<?php echo $this->_options['name']; ?>';

                            $('#' + rel_id + '-edit').click(function(e) {
                                $('#' + rel_id + '-data').css('left', e.pageX).css('top', e.pageY).show();
                            });

                            $('.' + rel_class).click(function() {
                                var rel_ids = [];
                                $('.' + rel_class + ':checked').each(function() {
                                    rel_ids.push($(this).val());
                                });
                                $('#' + rel_id).val(rel_ids.join(','));
                                $('#' + rel_id + '-notice span').html(rel_ids.length);
                            });
                        });
                    </script>

                    <div class="<?php echo $this->_options['class']; ?> relations">
                        <input type="hidden" name="<?php echo $this->_options['name']; ?>" id="<?php echo $this->_options['id']; ?>" value="" />
                        <div id="<?php echo $this->_options['id']; ?>-notice">
                            <span class="bold"><?php echo count($this->_value); ?></span>/<?php echo count($this->_data); ?> <?php echo T('items'); ?>
                            <input type="button" name="<?php echo $this->_options['name']; ?>-edit" id="<?php echo $this->_options['id']; ?>-edit" class="rel-edit" value="<?php echo T('Edit'); ?>" />
                        </div>
                        <div id="<?php echo $this->_options['id']; ?>-data" class="hidden popup">
                            <div class="hide_this">[X] <?php echo T('Close'); ?></div>
                            <div class="content">
                                <ul>
                                    <?php foreach ($this->_data as $id => $label) : ?>
                                    <li>
                                        <input type="checkbox" name="<?php echo $this->_options['name']; ?>-items" class="<?php echo $this->_options['class']; ?>" value="<?php echo $id; ?>" <?php if (in_array($id, $this->_selected)) echo 'checked="checked"'; ?>/>
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
                    return '<div id="' . $this->_options['id'] . '" class="' . $this->_options['class'] . ' relations">'.T('No posts found') .'</div>';
                }
            } else {
                return false;
            }
        }
    }
