<?php
    /**
      * @desc Bootstrap base engine classes
      * @package M2 Micro Framework
      * @subpackage Main
      * @author Alexander Chaika
      */

    // Simple ACL hook
    define('M2_MICRO', 1);
        
    // define globals
    define('NL', chr(13).chr(10));
    define('DS', DIRECTORY_SEPARATOR);

    // errors & messages levels
    define('ERROR',   1);
    define('WARNING', 2);
    define('NOTICE',  6);
    define('MESSAGE', 8);
    
    // system classes
    set_include_path(dirname(__FILE__) . DS .'includes;'.get_include_path());
    require_once 'function.php';
    require_once 'application.php';
    require_once 'system.php';
    require_once 'database.php';
    require_once 'sef.php';
    
    // get main controller
    require_once dirname(__FILE__) . DS .'modules'. DS. 'controller.php';
    require_once dirname(__FILE__) . DS .'modules'. DS. 'model.php';
    require_once dirname(__FILE__) . DS .'modules'. DS. 'view.php';