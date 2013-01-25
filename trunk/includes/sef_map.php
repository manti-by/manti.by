<?php 
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
      * Sef map array
      * @name $sef_map
      * @package M2 Micro Framework
      * @subpackage Library
      * @author Alexander Chaika
      * @since 0.2RC1
      */

    return array(
        '/\?module\=blog\&action\=show\&id\=(.*)/' => array(
            'table'  => 'post',
            'field'  => 'alias',
            'prefix' => 'blog/',
            'suffix' => Application::$config['sef_suffix']
        ),
        '/\?module\=gallery\&action\=show\&id\=(.*)/' => array(
            'table'  => 'gallery',
            'field'  => 'alias',
            'prefix' => 'gallery/',
            'suffix' => Application::$config['sef_suffix']
        ),
        '/\?module\=tag\&action\=search\&id\=(.*)/' => array(
            'table'  => 'tags',
            'field'  => 'alias',
            'prefix' => 'tag/',
            'suffix' => Application::$config['sef_suffix']
        ),
        '/\?module\=tag\&action\=search\&q\=(.*)/' => array(
            'table'  => 'tags',
            'field'  => 'name',
            'prefix' => 'tag/',
            'suffix' => Application::$config['sef_suffix']
        )
    );