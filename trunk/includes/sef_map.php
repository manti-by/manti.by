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
            'prefix' => '/blog/',
            'suffix' => $config['sef_suffix']
        ),
        '/\?module\=blog\&action\=category\&id\=(.*)/' => array(
            'table'  => 'category',
            'field'  => 'alias',
            'prefix' => '/category/',
            'suffix' => $config['sef_suffix']
        )
    );