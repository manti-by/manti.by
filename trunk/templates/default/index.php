<?php
    /**
      * Default template file
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */

     $stack = $this->getLastFromStack();
     $message = $stack['message'];
     $class = strtolower(getErrorStringFromInt($stack['level']));

?>
<html>
    <?php include 'head.php'; ?>
    <body>
        <div id="popup">
            <div class="head">[X] <?php echo T('Close'); ?></div>
            <div class="content"></div>
        </div>
        <?php if($this->isMessagePresent()) : ?>
            <div id="message" class="<?php echo $class; ?>">
                <div class="hide_this">[X] <?php echo T('Close'); ?></div>
                <div><?php echo $message; ?></div>
            </div>
        <?php endif; ?>
        <div id="wrapper">
            <?php include 'topmenu.php'; ?>

            <?php echo $options['body']; ?>

            <?php include 'footer.php'; ?>
        </div>
    </body>
</html>