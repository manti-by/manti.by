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
     * Relations control helper
     * @package M2 Micro Framework
     * @subpackage Controls
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class Relations extends Control {

        /**
         * Set options
         * @param array $options for set
         * @return array $options
         */
        public function setOptions($options) {
            parent::setOptions($options);

            // Set reference id
            if (isset($options['reference_id'])) {
                $this->_options['reference_id'] = $options['reference_id'];
            }

            return $this->_options;
        }

        /**
         * Return HTML markup for control
         * @return bool|string
         */
        public function render() {
            $html = parent::render();
            if (!empty($html)) {
                $this->_data  = Model::getModel('blog')->getPosts(100, 1);
                $this->_value = Model::getModel('blog')->getPostRelationsById($this->_options['reference_id']);
                $this->_value_type = self::TYPE_ARRAY;

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

                    <div class="<?php echo $this->_options['class']; ?> relations-control">
                        <input type="hidden" name="<?php echo $this->_options['name']; ?>" id="<?php echo $this->_options['id']; ?>" value="<?php echo $this->getValue(); ?>" />
                        <div id="<?php echo $this->_options['id']; ?>-notice">
                            <span class="bold"><?php echo count($this->_value); ?></span>/<?php echo count($this->_data); ?> <?php echo T('items'); ?>
                            <input type="button" name="<?php echo $this->_options['name']; ?>-edit" id="<?php echo $this->_options['id']; ?>-edit" class="rel-edit" value="<?php echo T('Edit'); ?>" />
                        </div>
                        <div id="<?php echo $this->_options['id']; ?>-data" class="hidden popup">
                            <div class="hide_this">[X] <?php echo T('Close'); ?></div>
                            <div class="content">
                                <ul>
                                    <?php foreach ($this->_data as $item) : ?>
                                    <li>
                                        <input type="checkbox" name="<?php echo $this->_options['name']; ?>-items" class="<?php echo $this->_options['class']; ?>" value="<?php echo $item->id; ?>" <?php if (array_key_exists($item->id, $this->_value)) echo 'checked="checked"'; ?>/>
                                        <?php echo $item->name; ?>
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

        /**
         * Return html markup for json data
         * @static
         * @param string $json
         * @return bool|string
         */
        public static function getHtml($json) {
            $result = '';
            $relations = json_decode($json);
            if (is_array($relations)) {
                foreach ($relations as $relation) {
                    $result .= '<a href="' . Sef::getSef('index.php?module=blog&action=show&id=' . $relation->id) . '" class="relation">';
                    $result .= '<img src="' . Application::$config['http_host'] . substr($relation->source, 1) . '" class="small-cover" />';
                    $result .= '<div class="title">' .$relation->name . '</div>';
                    $result .= '</a>';
                }
            } else {
                return self::getInstance()->_throw(T('Incorect JSON data for relations'), MESSAGE);
            }

            return $result;
        }
    }
