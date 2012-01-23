<?php
    /**
      * Default template file
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */
      
    ;
?>
<html>
    <head>
        <title><?php echo strip_tags($options['title']); ?></title>
        <link type="text/css" rel="stylesheet" href="<?php echo $this->config['http_host']; ?>/assets/css/default.css" />
        <script type="text/javascript" src="<?php echo $this->config['http_host']; ?>/assets/js/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#popup .head').click(function() {
                    $('#popup').hide();
                });
            });
        </script>
    </head>
    <body>
        <div id="popup">
            <div class="head">[X] <?php echo T('Close'); ?></div>
            <div class="content"></div>
        </div>
        <div id="wrapper">
            <?php echo $options['body']; ?>
        </div>
    </body>
</html>