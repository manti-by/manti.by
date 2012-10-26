<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Toolbar plugin
     * @name $toolbar
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */

    $user = UserEntity::getInstance();
?>
<div id="toolbar" class="fr">
    <?php if ($user->isLoggined()) : ?>
        <?php echo T('Hi') . ' ' . $user->getUsername(); ?>!
        <a href="<?php echo Sef::getSef('index.php?module=blog&action=edit');?>"><?php echo T('New Post'); ?></a> |
        <a href="<?php echo Sef::getSef('index.php?module=file'); ?>"><?php echo T('View Files'); ?></a> |
        <a href="<?php echo Sef::getSef('index.php?module=user&action=logout'); ?>"><?php echo T('Sign Out'); ?></a>
    <?php else : ?>
        <a href="<?php echo Sef::getSef('index.php?module=user&action=loginform'); ?>"><?php echo T('Sign In'); ?></a> |
        <a href="<?php echo Sef::getSef('index.php?module=user&action=registerform'); ?>"><?php echo T('Sign Up'); ?></a>
    <?php endif; ?>
</div>
