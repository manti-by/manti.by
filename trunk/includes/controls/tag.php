<?php
    /**
     * Tag control helper
     * @package M2 Micro Framework
     * @subpackage Library Tags
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
            if (parent::render()) {
                // Render markup
                $html  = '<div class="tag">';
                $html .= '
                    <script type="text/javascript">
                        $(document).ready(function() {
                            // Delete action for tag
                            $(\'.' . $this->_options['class'] . '-del\').live(\'click\', function() {
                                // Get params
                                var rel = $(this).attr(\'rel\');
                                var val = $(\'li#\' + rel).attr(\'rel\');
                                var tags = $(\'#' . $this->_options['id'] . '\').val().split(\',\');

                                // Remove value from hidden input and control
                                for (var i = 0; i < tags.length; i++) {
                                    if (tags[i] == val) {
                                        tags.splice(i, 1);
                                        $(\'#' . $this->_options['id'] . '\').val(tags.join(\',\'));
                                        $(\'li#\' + rel).remove();
                                        return true;
                                    }
                                }
                                return false;
                            });

                            // Add new tag
                            $(\'#' . $this->_options['id'] . '-add\').click(function() {
                                // Check tag length
                                var val = $(\'#' . $this->_options['id'] . '-input\').val();
                                if (val.length < 3) {
                                    alert(\'' . T('Minimum tag length 3 symbols') . '\');
                                    return false;
                                }

                                // Check existing
                                var tags = $(\'#' . $this->_options['id'] . '\').val().split(\',\');
                                if (tags.indexOf(val) >= 0) {
                                    alert(\'' . T('This tag already exists') . '\');
                                    return false;
                                }

                                // Add new tag
                                tags.push(val);
                                $(\'#' . $this->_options['id'] . '\').val(tags.join(\',\'));

                                // Create new control for this tag
                                var index = tags.length + 1;
                                $(\'ul#' . $this->_options['id'] . '-control\').append(\'<li id="' . $this->_options['id'] . '-item-\' + index + \'" class="' . $this->_options['class'] . '-item" rel="\' + val + \'">\' + val + \'<input type="button" name="' . $this->_options['name'] . '-del-\' + index + \'" id="' . $this->_options['id'] . '-del-\' + index + \'" rel="' . $this->_options['id'] . '-item-\' + index + \'" class="' . $this->_options['class'] . '-del tag-del" value="X" /></li>\');

                                return true;
                            });

                            $(\'.tag-wrap\').click(function() {
                                $(this).children(\'.tag-input\').focus();
                            });
                        });
                    </script>';

                // Create header
                $value = !empty($this->_tags) && count($this->_tags) > 0 ? implode(',', $this->_tags) : '';
                $html .= '<input type="hidden" id="' . $this->_options['id'] . '" name="' . $this->_options['name'] . '" value="' . $value . '" />';
                $html .= '<div class="tag-wrap">';
                $html .= '<ul id="' . $this->_options['id'] . '-control" class="' . $this->_options['class'] . '-control">';

                // Create body
                $i = 1;
                foreach ($this->_data as $tag) {
                    $html .= '<li id="' . $this->_options['id'] . '-item-' . $i . '" class="' . $this->_options['class'] . '-item" rel="' . $tag . '">';
                        $html .= $tag;
                        $html .= '<input type="button" name="' . $this->_options['name'] . '-del-' . $i . '" id="' . $this->_options['id'] . '-del-' . $i . '" rel="' . $this->_options['id'] . '-item-' . $i . '" class="' . $this->_options['class'] . '-del tag-del" value="X" />';
                    $html .= '</li>';
                    $i++;
                }
                $html .= '</ul>';

                // Create input
                $html .= '<input type="text" name="' . $this->_options['name'] . '-input" id="' . $this->_options['id'] . '-input" class="tag-input" value="" />';
                $html .= '</div>';
                $html .= '<input type="button" name="' . $this->_options['name'] . '-add" id="' . $this->_options['id'] . '-add" class="tag-add" value="Add" />';
                $html .= '</div>';

                return $html;
            } else {
                return false;
            }
        }
    }
