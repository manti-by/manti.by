<?php
    /**
      * Global autoload functions for classes
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      */

    // load system classes
    require_once DOC_ROOT . DS . 'includes' . DS . 'application.php';
    require_once DOC_ROOT . DS . 'includes' . DS . 'database.php';
    require_once DOC_ROOT . DS . 'includes' . DS . 'system.php';
    require_once DOC_ROOT . DS . 'includes' . DS . 'sef.php';
    require_once DOC_ROOT . DS . 'includes' . DS . 'user.php';
    
    // simply load mvc structure for modules
    require_once DOC_ROOT . DS . 'modules' . DS . 'controller.php';
    require_once DOC_ROOT . DS . 'modules' . DS . 'model.php';
    require_once DOC_ROOT . DS . 'modules' . DS . 'view.php';