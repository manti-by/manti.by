<?php

define('M2_MICRO', 1);
require_once '../app/bootstrap.php';

Application::init();

$path = realpath('./images') . DS;
$sources = array(
    $path . 'resize/test_horizontal.jpg',
    $path . 'resize/test_vertical.jpg',
    $path . 'resize/test_ratio_16-9.jpg',
    $path . 'resize/test_ratio_4-3.jpg'
);

foreach ($sources as $source) {
    $pathinfo = pathinfo($source);
    $thumbname   = $path . 'thumb_' . $pathinfo['filename'] . '.jpg';
    $previewname = $path . 'preview_' . $pathinfo['filename'] . '.jpg';
    $fullhdname  = $path . 'fullhd_' . $pathinfo['filename'] . '.jpg';

    System::getInstance()->resize(
        $source,
        $thumbname,
        Application::$config['thumb_width'],
        Application::$config['thumb_height'],
        System::RESIZE_FACE_DETECT
    );

    System::getInstance()->resize(
        $source,
        $previewname,
        Application::$config['preview_width'],
        Application::$config['preview_height'],
        System::RESIZE_FACE_DETECT
    );

    System::getInstance()->resize(
        $source,
        $fullhdname,
        Application::$config['fullhd_width'],
        Application::$config['fullhd_height'],
        System::RESIZE_WITH_RATIO
    );
}