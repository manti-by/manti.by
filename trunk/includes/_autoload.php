<?php
    /**
      * Global autoload functions for classes
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      */

    // load system classes
    require_once LIB_PATH . DS . 'application.php';
    require_once LIB_PATH . DS . 'database.php';
    require_once LIB_PATH . DS . 'system.php';
    require_once LIB_PATH . DS . 'sef.php';
    require_once LIB_PATH . DS . 'user.php';
    
    // simply load mvc structure for modules
    require_once ROOT_PATH . DS . 'modules' . DS . 'controller.php';
    require_once ROOT_PATH . DS . 'modules' . DS . 'model.php';
    require_once ROOT_PATH . DS . 'modules' . DS . 'view.php';