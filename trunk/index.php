<?php
    /**
      * Front index controller
      * @package M2 Micro Framework
      * @subpackage Main
      * @author Alexander Chaika
      */

    // get engine
    require_once 'bootstrap.php';
    
    // Init Sef engine
    Application::init();

    // get mvc controller and dispatch request
    $controller = new Controller();
    $controller->dispatch();
    
    // shutdown application
    Application::shutdown();