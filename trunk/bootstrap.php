<?php
    /**
      * @desc Bootstrap base engine classes
      * @package M2 Micro Framework
      * @subpackage Main
      * @author Alexander Chaika
      */

    // start session
    if (isset($_COOKIE['PHPSESSID'])) {
        session_id($_COOKIE['PHPSESSID']);
    }
    session_start();

    // set working mode
    ini_set('display_errors', 1);

    // Simple ACL hook
    define('M2_MICRO', 1);
        
    // define globals
    define('NL', chr(13).chr(10));
    define('DS', DIRECTORY_SEPARATOR);
    define('DOC_ROOT', __DIR__);

    // errors & messages levels
    define('ERROR',   1);
    define('WARNING', 2);
    define('NOTICE',  6);
    define('MESSAGE', 8);
    
    // system classes
    set_include_path(DOC_ROOT . DS . 'includes;' . get_include_path());
    require_once '_function.php';
    require_once '_autoload.php';