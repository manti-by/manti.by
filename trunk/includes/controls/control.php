<?php
    /**
     * Control helper class
     * @package M2 Micro Framework
     * @subpackage Library Tags
     * @author Alexander Chaika
     */
    class Control extends Application {

        protected $_data = array();
        protected $_options = array('id' => '', 'class' => '', 'name' => '');

        /**
         * Class constructor
         * @param mixed $data (optional)
         * @param mixed $options (optional)
         */
        public function __construct($data = null, $options = null) {
            // Set initial tags
            if (!empty($data)) {
                $this->setData($data);
            }

            // Set initial options
            if (!empty($options)) {
                $this->setOptions($options);
            }
        }

        /**
         * Set data set
         * @param $data for set
         * @return array|bool $tags
         */
        public function setData($data) {
            // Check empty
            if (empty($data)) {
                return $this->_throw(T('Control data could not be empty'), NOTICE);
            }

            // Set values
            if (is_array($data)) {
                $this->_data = $data;
            } else {
                $this->_data = array($data);
            }

            return $this->_data = array_unique($this->_data);
        }

        /**
         * Append data to existing value set
         * @param $data to append
         * @return array|bool $data
         */
        public function appendData($data) {
            // Check empty
            if (empty($data)) {
                return $this->_throw(T('Control data could not be empty'), NOTICE);
            }

            // Append values
            if (is_array($data)) {
                $this->_data = $this->_data + $data;
            } else {
                $this->_data = $this->_data + array($data);
            }

            return $this->_data = array_unique($this->_data);
        }

        /**
         * Get data
         * @return array $data
         */
        public function getData() {
            return $this->_data;
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
            return '<input type="text" name="' . $this->_options['name'] . '" id="' . $this->_options['id'] . '" class="' . $this->_options['class'] . '" value="' . implode(',', $this->_data) . '" />';
        }
    }
