<?php
    /**
      * Global autoload functions for classes
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      */

    // load system classes
    spl_autoload_register('autoload_system_libraries');
    function autoload_system_libraries($class) {
        require_once $class . '.php';
    }
    
    // simply load mvc structure for modules
    require_once DOC_ROOT . DS . 'modules' . DS . 'controller.php';
    require_once DOC_ROOT . DS . 'modules' . DS . 'model.php';
    require_once DOC_ROOT . DS . 'modules' . DS . 'view.php';