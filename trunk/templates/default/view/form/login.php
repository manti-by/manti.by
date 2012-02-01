<?php
    /**
      * @author Alexander Chaika
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */
?>
<h1><?php echo $options['title']; ?></h1>
<form id="login-form" method="POST">
    <input type="hidden" name="module" value="user" />
    <input type="hidden" name="action" value="login" />
    <p>
        <label for="email"><?php echo T('Email'); ?></label>
        <input type="text" name="email" value="" />
    </p>
    <p>
        <label for="password"><?php echo T('Password'); ?></label>
        <input type="text" name="password" value="" />
    </p>
    <p>
        <label for="remember">&nbsp;</label>
        <input type="checkbox" name="remember" value="1" />
        <?php echo T('Remember me'); ?>
    </p>
    <p>
        <label for="submit">&nbsp;</label>
        <input type="submit" name="submit" value="<?php echo T('Login'); ?>" />
    </p>
</form>

