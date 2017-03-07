<?php

define('M2_MICRO', 1);
require_once '../app/bootstrap.php';

Application::init();

$result = System::getFaceRectangle(realpath('./images/opencv/test.jpg'));
var_dump($result);
