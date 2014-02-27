<?php
    /**
     * CLI bootstrap file for utils
     * @author Alexander Chaika <manti.by@gmail.com>
     * @package M2 Micro Framework
     * @subpackage Tools
     * @version 0.4.0 alpha
     */

    // Chech output line end
    if (php_sapi_name() == 'cli') define('EL', PHP_EOL);
    else define('EL', '<br />');

    // Show all errors
    ini_set('error_reporting', 'E_ALL & ~E_NOTICE & ~E_DEPRECATED');

    // File options and scripts path
    define('DS', DIRECTORY_SEPARATOR);
    define('FILE_PATH', dirname(__DIR__) . DS . 'database');

    // Exit message function
    function close($message) {
        echo $message . EL . 'Close tool. Bye!' . EL;
        die;
    }

    // Message function
    function message($message) {
        echo $message . EL;
    }