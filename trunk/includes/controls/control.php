<?php
    /**
     * Control helper class
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     * @since 0.3RC2
     */
    class Control extends Application {

        const TYPE_ARRAY = 0;
        const TYPE_JSON  = 1;

        protected $_value = array();
        protected $_value_type = self::TYPE_ARRAY;
        protected $_data = array();
        protected $_options = array('id' => '', 'class' => '', 'name' => '');

        protected $_main_field = 'name';

        /**
         * Class constructor
         * @param mixed $value (optional)
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
         * @param mixed $value for set
         * @return array|bool $tags
         */
        public function setValue($value) {
            // Check empty
            if (empty($value)) {
                return $this->_throw(T('Control value could not be empty'), NOTICE);
            }

            // Set values
            $json = json_decode($value);
            $exploded = explode(',', $value);
            if (is_array($value)) {
                $this->_value = $value;
            } elseif ($json) {
                $this->_value = $json;
                $this->_value_type = self::TYPE_JSON;
            } elseif (is_array($exploded) && count($exploded) > 1) {
                $this->_value = $exploded;
            } else {
                $this->_value = array($value);
            }

            return $this->_value;
        }

        /**
         * Append data to existing value set
         * @param mixed $value to append
         * @return array|bool $data
         */
        public function appendValue($value) {
            // Check empty
            if (empty($value)) {
                return $this->_throw(T('Control data could not be empty'), NOTICE);
            }

            // Append values
            $exploded = explode(',', $value);
            $json = json_decode($value);
            if (is_array($value)) {
                $this->_value = $this->_value + $value;
            } elseif (is_array($exploded) && count($exploded) > 1) {
                $this->_value = $this->_value + $exploded;
            } elseif ($json) {
                $this->_value = $this->_value + $json;
                $this->_value_type = self::TYPE_JSON;
            } else {
                $this->_value = $this->_value + array($value);
            }

            return $this->_value;
        }

        /**
         * Get data
         * @param string $main_field OPTIONAL
         * @return string $value
         */
        public function getValue($main_field = null) {
            // Compile value
            $result = '';
            foreach ($this->_value as $value) {
                if ($this->_value_type == self::TYPE_JSON) {
                    $main_field = empty($main_field) ? $this->_main_field : $main_field;
                    $temp = $value->$main_field;
                } else {
                    $temp = $value;
                }
                $result .= empty($result) ? $temp : ',' . $temp;
            }

            return $result;
        }

        /**
         * Set options
         * @param array $options for set
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
            return '<input type="text" name="' . $this->_options['name'] . '" id="' . $this->_options['id'] . '" class="' . $this->_options['class'] . '" value="' . $this->getValue() . '" />';
        }
    }
