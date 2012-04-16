<?php
    /**
      * @desc Video object
      * @name $menu
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */

    $stack = $this->getLastFromStack();
    $message = $stack['message'];
    $class = strtolower(getErrorStringFromInt($stack['level']));
?>
<?php if($this->isMessagePresent()) : ?>
    <div id="message" class="<?php echo $class; ?>">
        <div class="hide_this">[X] <?php echo T('Close'); ?></div>
        <div><?php echo $message; ?></div>
    </div>
<?php endif; ?>
