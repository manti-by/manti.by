<?php
    /**
     * File control helper
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     */
    class File extends Control {

        /**
         * Class constructor
         * @param mixed $data (optional)
         * @param mixed $options (optional)
         */
        public function __construct($data = null, $options = null) {
            parent::__construct($data, $options);

            // Set file type
            if (isset($options['type'])) {
                $this->_options['type'] = $options['type'];
            }

            $this->config = System::getInstance()->getConfig();
        }

        /**
         * Return HTML markup for control
         * @return bool|string
         */
        public function render() {
            if ($html = parent::render()) {
                $this->_data = Model::getModel('file')->getList($this->_options['type']);
                if ($this->_data) {
                    // Create script
                    $html .= '
                        <script type="text/javascript">
                            $(document).ready(function() {
                                $(\'#edit\').click(function() {
                                    $(\'#popup #content\').html($(\'#' . $this->_options['id'] . '-data\').html());
                                    $(\'#popup\').show();
                                });

                                $(\'#close\').click(function() {
                                    $(\'#' . $this->_options['id'] . '-data\').html($(\'#popup .content\').html());
                                    $(\'#popup .content\').html(\'\');
                                    $(\'#popup\').hide();
                                });
                            });
                        </script>';

                    // Create header
                    $html .= '<div id="' . $this->_options['id'] . '" class="' . $this->_options['class'] . ' files">';
                    $html .= '<div id="' . $this->_options['id'] . '-notice">' . $this->_data . ' ' . T('items') . '</div>';
                    $html .= '<div id="' . $this->_options['id'] . '-data">';

                    // Create body
                    $html .= '<ul class="hidden">';
                    foreach ($this->_data as $id => $label) {
                        $html .= '<li>';
                        $html .= '<input type="checkbox" name="' . $this->_options['name'] . '" value="' . $id . '" />';
                        $html .= $label;
                        $html .= '</li>';
                    }

                    // Close body
                    $html .= '<input type="button" name="' . $this->_options['name'] . '-close" id="' . $this->_options['id'] . '-close" class="file-close" value="Close" />';
                    $html .= '</ul>';
                    $html .= '</div>';

                    // Edit button
                    $html .= '<input type="button" name="' . $this->_options['name'] . '-edit" id="' . $this->_options['id'] . '-edit" class="file-edit" value="Edit" />';
                    $html .= '</div>';

                    return $html;
                }
                return $html;
            } else {
                return false;
            }
        }
    }
