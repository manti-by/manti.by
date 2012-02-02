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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
            <?php echo $options['body']; ?>
        </div>
    </body>
</html>