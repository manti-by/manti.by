<?php
    /**
      * Default template file
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */
?>
<html>
    <?php include 'head.php'; ?>
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