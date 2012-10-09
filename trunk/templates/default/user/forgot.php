<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Forgot password form
     * @name $forgot-form
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<form id="forgot-form" method="POST" action="<?php echo Sef::getSef('index.php'); ?>">
    <input type="hidden" name="module" value="user" />
    <input type="hidden" name="action" value="forgot" />
    <p class="big">
        <?php echo T('Enter your email for new password'); ?>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <label for="email"><?php echo T('Email'); ?></label>
        <input type="text" name="email" value="" />
    </p>
    <p>
        <label for="submit">&nbsp;</label>
        <input type="submit" name="submit" value="<?php echo T('Send'); ?>" />
        <a href="<?php echo Sef::getSef('index.php?module=user&action=registerform'); ?>"><?php echo T('Register'); ?></a>
        <?php echo T('or'); ?>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=loginform'); ?>"><?php echo T('Login'); ?></a>
    </p>
</form>

