<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog post template
     * @name $post-item
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     * @since 0.1
     */

    $user = UserEntity::getInstance();
?>
<div class="post-item">
    <h2>
        <?php echo $options['data']->name; ?>

        <?php if ($user->getGroup() == 'Root') : ?>
            <div class="fr admin-buttons">
                <a href="<?php echo Sef::getSef('index.php?module=blog&action=edit&id=' . $options['data']->id); ?>"><?php echo T('Edit'); ?></a>
                <a href="<?php echo Sef::getSef('index.php?module=blog&action=delete&id=' . $options['data']->id); ?>"><?php echo T('Delete'); ?></a>
            </div>
        <?php endif; ?>
    </h2>

    <div class="teaser">
        <?php echo nl2br($options['data']->teaser); ?>
    </div>

    <?php echo $this->getContents('blog', 'music-block', $options); ?>

    <div class="fulllink">
        <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=' . $options['data']->id); ?>"><?php echo T('View full post'); ?></a>
    </div>
</div>