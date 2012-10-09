<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Default template file
     * @name $template-index
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<html>
    <head>
        <title><?php echo strip_tags($options['title']); ?></title>
        <link type="text/css" rel="stylesheet" href="<?php echo Application::$config['http_host']; ?>/assets/css/default.css" />
        <link type="text/css" rel="stylesheet" href="<?php echo Application::$config['http_host']; ?>/templates/default/style.css" />
        <script type="text/javascript" src="<?php echo Application::$config['http_host']; ?>/assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo Application::$config['http_host']; ?>/assets/js/default.js"></script>
    </head>
    <body>
        <?php echo $this->getContents('plugin', 'popup'); ?>
        <?php echo $this->getContents('plugin', 'messages'); ?>

        <div id="header" class="wrapper">
            <?php echo $this->getContents('plugin', 'topmenu'); ?>
            <?php echo $this->getContents('plugin', 'toolbar'); ?>
            <div class="cls"></div>
        </div>

        <div id="content" class="wrapper">
            <?php echo $options['body']; ?>
        </div>

        <div id="footer" class="wrapper">
            marco_manti&copy; 2006 - <?php echo date('Y'); ?>
        </div>

        <?php echo $this->getContents('plugin', 'debug'); ?>
    </body>
</html>