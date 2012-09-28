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
    date_default_timezone_set('Europe/Minsk');
    ini_set('display_errors', 1);
    ini_set('error_reporting', 'E_ALL & ~E_NOTICE & ~E_DEPRECATED');

    // Simple ACL hook
    define('M2_MICRO', 1);

    // define globals
    define('NL', chr(13).chr(10));
    define('DS', DIRECTORY_SEPARATOR);
    define('ROOT_PATH', __DIR__);
    define('LIB_PATH', ROOT_PATH . DS . 'includes');

    // errors & messages levels
    define('ERROR',   1);
    define('WARNING', 2);
    define('NOTICE',  6);
    define('MESSAGE', 8);

    // system classes
    require_once LIB_PATH . DS . '_function.php';
    require_once LIB_PATH . DS . '_autoload.php';