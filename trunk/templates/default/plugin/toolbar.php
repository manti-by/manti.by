<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Toolbar plugin
     * @name $toolbar
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     */

    $user = UserEntity::getInstance();
?>
<div id="toolbar" class="fr">
    <?php if ($user->isLoggined()) : ?>
        <div class="welcome">
            <?php echo T('Hi') . ' ' . $user->getUsername(); ?>!
        </div>
        <a href="<?php echo Sef::getSef('index.php?module=user'); ?>"><?php echo T('Dashboard'); ?></a> |
        <a href="<?php echo Sef::getSef('index.php?module=user&action=logout'); ?>"><?php echo T('Logout'); ?></a>
    <?php else : ?>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=loginform'); ?>"><?php echo T('Login'); ?></a> |
        <a href="<?php echo Sef::getSef('index.php?module=user&action=registerform'); ?>"><?php echo T('Register'); ?></a>
    <?php endif; ?>
</div>
