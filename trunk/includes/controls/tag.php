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
     * Tag control helper
     * @package M2 Micro Framework
     * @subpackage Controls
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class Tag extends Control {

        /**
         * Return HTML markup for control
         * @return string $html
         */
        public function render() {
            // Check parent errors
            $html = parent::render();
            if (!empty($html)) {
                $this->_data = Model::getModel('tag')->getTagsByIds($this->getValue('id'));
                ob_start();
                ?>
                    <div class="tag-control">
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

                                    // #43634517 - Fix autocomplete add action
                                    $('#' + tag_id + '-input').val('');

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

        /**
         * Return html markup for json tags data
         * @static
         * @param string $json
         * @return bool|string
         */
        public static function getHtml($json) {
            $result = '';
            $tags = json_decode($json);
            if (is_array($tags)) {
                foreach ($tags as $tag) {
                    $result .= '<a href="' . Sef::getSef('index.php?module=tag&action=search&id=' . $tag->id) . '" class="tag" title="' . $tag->name . '">' . $tag->name . '</a>';
                }
            } else {
                return self::getInstance()->_throw(T('Incorect JSON data for tags'), MESSAGE);
            }

            return $result;
        }
    }
