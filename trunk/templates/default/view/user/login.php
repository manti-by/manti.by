<?php
    /**
      * @author Alexander Chaika
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */
?>
<form id="login-form" method="POST" action="<?php echo Sef::getSef('index.php'); ?>">
    <input type="hidden" name="module" value="user" />
    <input type="hidden" name="action" value="login" />
    <p class="big">
        <?php echo T('To access closed site areas please login first'); ?>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <label for="email"><?php echo T('Email'); ?></label>
        <input type="text" name="email" value="" />
    </p>
    <p>
        <label for="password"><?php echo T('Password'); ?></label>
        <input type="password" name="password" value="" />
    </p>
    <p>
        <label for="submit">&nbsp;</label>
        <input type="submit" name="submit" value="<?php echo T('Login'); ?>" />
        <input type="checkbox" name="remember" value="1" />
        <?php echo T('Remember me'); ?>
    </p>
    <p>
        <label for="submit">&nbsp;</label>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=registerform'); ?>"><?php echo T('Register'); ?></a>
        <?php echo T('or'); ?>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=forgotform'); ?>"><?php echo T('Forgot password?'); ?></a>
    </p>
</form>

