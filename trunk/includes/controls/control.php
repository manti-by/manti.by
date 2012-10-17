<?php
    /**
     * Control helper class
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class Control extends Application {

        protected $_value = array();
        protected $_options = array('id' => '', 'class' => '', 'name' => '');

        /**
         * Class constructor
         * @param mixed $data (optional)
         * @param mixed $options (optional)
         */
        public function __construct($value = null, $options = null) {
            // Set initial tags
            if (!empty($value)) {
                $this->setValue($value);
            }

            // Set initial options
            if (!empty($options)) {
                $this->setOptions($options);
            }
        }

        /**
         * Set data set
         * @param $value for set
         * @return array|bool $tags
         */
        public function setValue($value) {
            // Check empty
            if (empty($value)) {
                return $this->_throw(T('Control value could not be empty'), NOTICE);
            }

            // Set values
            if (is_array($value)) {
                $this->_value = $value;
            } else {
                $this->_value = array($value);
            }

            return $this->_value = array_unique($this->_value);
        }

        /**
         * Append data to existing value set
         * @param $value to append
         * @return array|bool $data
         */
        public function appendValue($value) {
            // Check empty
            if (empty($value)) {
                return $this->_throw(T('Control data could not be empty'), NOTICE);
            }

            // Append values
            if (is_array($value)) {
                $this->_value = $this->_value + $value;
            } else {
                $this->_value = $this->_value + array($value);
            }

            return $this->_value = array_unique($this->_value);
        }

        /**
         * Get data
         * @return array $value
         */
        public function getValue() {
            return $this->_value;
        }

        /**
         * Set options
         * @param $options for set
         * @return array $options
         */
        public function setOptions($options) {
            // Check empty
            if (empty($options) || !is_array($options)) {
                return $this->_throw(T('Control options could not be empty'), NOTICE);
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
                return $this->_throw(T('Control name could not be empty'));
            }

            // Check empty id
            if (empty($this->_options['id'])) {
                $this->_options['id'] = $this->_options['name'] . '-id';
            }

            // Check empty class
            if (empty($this->_options['class'])) {
                $this->_options['class'] = $this->_options['name'] . '-class';
            }

            // Render markup and return
            return '<input type="text" name="' . $this->_options['name'] . '" id="' . $this->_options['id'] . '" class="' . $this->_options['class'] . '" value="' . implode(',', $this->_value) . '" />';
        }
    }
