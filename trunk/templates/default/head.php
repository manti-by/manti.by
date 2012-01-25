<?php
    /**
      * Head of template file
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */
?>
    <head>
        <title><?php echo strip_tags($options['title']); ?></title>
        <link type="text/css" rel="stylesheet" href="<?php echo $this->config['http_host']; ?>/assets/css/default.css" />
        <link type="text/css" rel="stylesheet" href="<?php echo $this->config['http_host']; ?>/templates/default/style.css" />
        <script type="text/javascript" src="<?php echo $this->config['http_host']; ?>/assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo $this->config['http_host']; ?>/assets/js/template.js"></script>
    </head>