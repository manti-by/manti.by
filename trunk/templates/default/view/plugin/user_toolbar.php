<?php
    /**
      * @desc Video object
      * @name $menu
      * @package M2 Micro Framework
      * @subpackage Template
      * @author Alexander Chaika
      */

    $user = User::getInstance();
?>
<div id="user">
    <?php if ($user->isLoggined()) : ?>
        <?php echo T('Hi') . ' ' . $user->getUsername(); ?>
    <?php else : ?>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=loginform'); ?>"><?php echo T('Login'); ?></a> | 
        <a href="<?php echo Sef::getSef('index.php?module=user&action=registerform'); ?>"><?php echo T('Register'); ?></a>
    <?php endif; ?>
</div>
