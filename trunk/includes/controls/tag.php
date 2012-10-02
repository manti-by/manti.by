<?php
    /**
     * Tag control helper
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     */
    class Tag extends Application {

        private $_tags = array();
        private $_options = array('id' => '', 'class' => '', 'name' => '');

        /**
         * Class constructor
         * @param mixed $tags (optional)
         * @param mixed $options (optional)
         */
        public function __construct($tags = null, $options = null) {
            // Set initial tags
            if (!empty($tags)) {
                $this->setTags($tags);
            }

            // Set initial options
            if (!empty($options)) {
                $this->setOptions($options);
            }
        }

        /**
         * Set tags
         * @param $tags for set
         * @return array|bool $tags
         */
        public function setTags($tags) {
            // Check empty
            if (empty($tags)) {
                return $this->_throw(T('Tags could not be empty'), NOTICE);
            }

            // Set values
            if (is_array($tags)) {
                $this->_tags = $tags;
            } else {
                $this->_tags = array($tags);
            }

            return $this->_tags = array_unique($this->_tags);
        }

        /**
         * Append tags to existing
         * @param $tags to append
         * @return array|bool $tags
         */
        public function appendTags($tags) {
            // Check empty
            if (empty($tags)) {
                return $this->_throw(T('Tags could not be empty'), NOTICE);
            }

            // Append values
            if (is_array($tags)) {
                $this->_tags = $this->_tags + $tags;
            } else {
                $this->_tags = $this->_tags + array($tags);
            }

            return $this->_tags = array_unique($this->_tags);
        }

        /**
         * Get tags
         * @return array $tags
         */
        public function getTags() {
            return $this->_tags;
        }

        /**
         * Set options
         * @param $options for set
         * @return array $options
         */
        public function setOptions($options) {
            // Check empty
            if (empty($options) || !is_array($options)) {
                return $this->_throw(T('Tags options could not be empty'), NOTICE);
            }

            // Set values
            if (isset($options['id'])) {
                $this->_options['id'] = $options['id'];
            }

            if (isset($options['class'])) {
                $this->_options['class'] = $options['class'];
            }

            if (isset($options['name'])) {
                $this->_options['name'] = $options['name'];
            }

            return $this->_options;
        }

        /**
         * Get options
         * @return array $options
         */
        public function getOptions() {
            return $this->_options;
        }

        /**
         * Return HTML markup for control
         * @return string $html
         */
        public function render() {
            // Check empty name
            if (empty($this->_options['name'])) {
                return $this->_throw(T('Tag name could not be empty'));
            }

            // Check empty id
            if (empty($this->_options['id'])) {
                $this->_options['id'] = $this->_options['name'] . '-id';
            }

            // Check empty class
            if (empty($this->_options['class'])) {
                $this->_options['class'] = $this->_options['name'] . '-class';
            }

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
                    });
                </script>';

            // Create header
            $html .= '<input type="hidden" id="' . $this->_options['id'] . '" name="' . $this->_options['name'] . '" value="' . implode(',', $this->_tags) . '" />';
            $html .= '<div class="tag-wrap">';
            $html .= '<ul id="' . $this->_options['id'] . '-control" class="' . $this->_options['class'] . '-control">';

            // Create body
            $i = 1;
            foreach ($this->_tags as $tag) {
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
        }
    }
