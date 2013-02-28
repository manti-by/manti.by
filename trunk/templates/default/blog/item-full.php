<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Full blog post template
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     * @since 0.1
     */

    $options['context'] = 'full';
    $user = UserEntity::getInstance();
?>
<div class="post-item-full">

    <h1>
        <?php echo $options['data']->name; ?>

        <?php if ($user->getGroup() == 'Root') : ?>
            <div class="fr admin-buttons">
                <a href="<?php echo Sef::getSef('index.php?module=blog&action=edit&id=' . $options['data']->id); ?>"><?php echo T('Edit'); ?></a>
                <a href="<?php echo Sef::getSef('index.php?module=blog&action=delete&id=' . $options['data']->id); ?>" class="ajax" callback="$(self).closest('.post-item-full').remove();"><?php echo T('Delete'); ?></a>
            </div>
        <?php endif; ?>
    </h1>

    <div class="description">
        <?php echo nl2br($options['data']->description); ?>
    </div>

    <?php echo $this->getContents('blog', 'music-block', $options); ?>

    <?php if ($options['data']->tracklist) : ?>
        <div class="tracklist">
            <h2><?php echo T('Tracklist'); ?></h2>
            <?php echo nl2br($options['data']->tracklist); ?>
        </div>
    <?php endif; ?>

    <?php if (json_decode($options['data']->relations)) : ?>
        <div class="relations">
            <h2><?php echo T('Similar posts'); ?></h2>
            <?php echo Relations::getHtml($options['data']->relations); ?>
            <div class="cls"></div>
        </div>
    <?php endif; ?>

</div>
<script type="text/javascript">
    $(document).ready(function() {
        $.get('<?php echo Sef::getSef('index.php?module=blog&action=track&id=' . $options['data']->id)?>');
    });
</script>