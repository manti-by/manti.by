<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Global messages plugin
     * @name $messages
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */

    $stack = $this->getLastFromStack();
    $message = $stack['message'];
    $class = strtolower(getErrorStringFromInt($stack['level']));
?>
<?php if ($this->isMessagePresent()) : ?>
    <div id="message" class="<?php echo $class; ?>">
        <div class="hide_this">[X] <?php echo T('Close'); ?></div>
        <div><?php echo $message; ?></div>
    </div>
<?php endif; ?>
