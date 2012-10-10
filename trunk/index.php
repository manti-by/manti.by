<?php
    /**
     * Front index controller
     * @package M2 Micro Framework
     * @subpackage Main
     * @author Alexander Chaika
     * @since 0.1
     */

    // get engine
    require_once 'bootstrap.php';
    
    // Init Sef engine
    Application::init();

    // Get MVC controller and dispatch request
    $controller = new Controller();
    $controller->dispatch();
    
    // Shutdown application
    Application::shutdown();