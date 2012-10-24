<?php
    /**
     * Tag control helper
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     * @since 0.3RC2
     * @todo Fix tags set and delete actions
     */
    class Tag extends Control {

        /**
         * Return HTML markup for control
         * @return string $html
         */
        public function render() {
            // Check parent errors
            if ($html = parent::render()) {
                $this->_data = Model::getModel('tag')->getTagsByIds($this->getValue('id'));
                ob_start();
                ?>
                    <div class="tag">
                        <script type="text/javascript">
                            $(document).ready(function() {
                                var tag_id      = '<?php echo $this->_options['id']; ?>';
                                var tag_class   = '<?php echo $this->_options['class']; ?>';
                                var tag_name    = '<?php echo $this->_options['name']; ?>';

                                // Delete action for tag
                                $('.' + tag_class + '-del').live('click', function() {
                                    // Get params
                                    var rel = $(this).attr('rel');
                                    var val = $('li#' + rel).attr('rel');
                                    var tags = $('#' + tag_id).val().split(',');

                                    // Remove value from hidden input and control
                                    for (var i = 0; i < tags.length; i++) {
                                        if (tags[i] == val) {
                                            tags.splice(i, 1);
                                            $('#' + tag_id).val(tags.join(','));
                                            $('li#' + rel).remove();
                                            return true;
                                        }
                                    }
                                    return false;
                                });

                                // Add new tag
                                $('#' + tag_id + '-add').click(function() {
                                    // Check tag length
                                    var val = $('#' + tag_id + '-input').val();
                                    if (val.length < 3) {
                                        alert('<?php echo T('Minimum tag length 3 symbols'); ?>');
                                        return false;
                                    }

                                    // Check existing
                                    var tags = $('#' + tag_id).val().split(',');
                                    if (tags.indexOf(val) >= 0) {
                                        alert('<?php echo T('This tag already exists'); ?>');
                                        return false;
                                    }

                                    // Add new tag and remove empty
                                    tags.push(val);
                                    for (var i = 0; i < tags.length; i++) {
                                        if (tags[i] == '') tags.splice(i, 1);
                                    }
                                    $('#' + tag_id).val(tags.join(','));

                                    // Create new control for this tag
                                    var index = tags.length + 1;
                                    $('ul#' + tag_id + '-control').append(
                                        '<li id="' + tag_id + '-item-' + index + '" class="' + tag_class + '-item" rel="' + val + '">' +
                                            val +
                                            '<input type="button" name="' + tag_name + '-del-' + index + '" id="' + tag_id + '-del-' + index + '" rel="' + tag_id + '-item-' + index + '" class="' + tag_class + '-del tag-del" value="X" />' +
                                        '</li>'
                                    );

                                    return true;
                                });

                                $('.tag-wrap').click(function() {
                                    $(this).children('.tag-input').focus();
                                });

                                $('#' + tag_id + '-input').keypress(function(event) {
                                    if (event.which == 13) $('#' + tag_id + '-add').click();
                                });
                            });
                        </script>

                        <?php $i = 1; ?>
                        <input type="hidden" id="<?php echo $this->_options['id']; ?>" name="<?php echo $this->_options['name']; ?>" value="<?php echo $this->getValue(); ?>" />
                        <div class="tag-wrap">
                            <ul id="<?php echo $this->_options['id']; ?>-control" class="<?php echo $this->_options['class']; ?>-control">
                                <?php foreach ($this->_data as $tag) : ?>
                                    <li id="<?php echo $this->_options['id']; ?>-item-<?php echo $i; ?>" class="<?php echo $this->_options['class']; ?>-item" rel="<?php echo $tag; ?>">
                                        <?php echo $tag; ?>
                                        <input type="button" name="<?php echo $this->_options['name']; ?>-del-<?php echo $i; ?>" id="<?php echo $this->_options['id']; ?>-del-<?php echo $i; ?>" rel="<?php echo $this->_options['id']; ?>-item-<?php echo $i; ?>" class="<?php echo $this->_options['class']; ?>-del tag-del" value="X" />
                                    </li>
                                    <?php $i++; ?>
                                <?php endforeach; ?>
                            </ul>
                            <input type="text" name="<?php echo $this->_options['name']; ?>-input" id="<?php echo $this->_options['id']; ?>-input" class="tag-input autocomplete" src="<?php echo Sef::getSef('index.php?module=tag&action=autocomplete'); ?>" value="" />
                        </div>
                        <input type="button" name="<?php echo $this->_options['name']; ?>-add" id="<?php echo $this->_options['id']; ?>-add" class="tag-add" value="Add" />
                    </div>
                <?php
                $html = ob_get_contents();
                ob_end_clean();

                return $html;
            } else {
                return false;
            }
        }
    }
