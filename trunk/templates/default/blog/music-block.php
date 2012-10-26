<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog post music block
     * @name $music-block
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */
?>
<?php if ($options['data']->is_music) : ?>
    <div class="music-block">
        <?php if (json_decode($options['data']->covers)) : ?>
            <div class="covers fl">
                <?php echo File::getHtml($options['data']->covers, FileEntity::TYPE_COVERS); ?>
            </div>
        <?php endif; ?>

        <?php if ($options['data']->catnum) : ?>
            <div class="catnum">
                <span class="bold"><?php echo T('Catalog No'); ?></span> :
                <?php echo $options['data']->catnum; ?>
            </div>
        <?php endif; ?>

        <?php if ($options['data']->genre) : ?>
            <div class="genre">
                <span class="bold"><?php echo T('Genre'); ?></span> :
                <?php echo $options['data']->genre; ?>
            </div>
        <?php endif; ?>

        <?php if ($options['data']->length) : ?>
            <div class="length">
                <span class="bold"><?php echo T('Length'); ?></span> :
                <?php echo $options['data']->length; ?>
            </div>
        <?php endif; ?>

        <?php if (json_decode($options['data']->covers)) : ?>
            <div class="quality">
                <span class="bold"><?php echo T('Quality'); ?></span> :
                <?php echo $options['data']->quality; ?>
            </div>
        <?php endif; ?>

        <?php if (json_decode($options['data']->preview)) : ?>
            <div class="preview">
                <?php echo File::getHtml($options['data']->preview, FileEntity::TYPE_PREVIEW); ?>
            </div>
        <?php endif; ?>

        <?php if (json_decode($options['data']->release)) : ?>
            <div class="release">
                <span class="bold"><?php echo T('Download Link'); ?></span> :
                <?php echo File::getHtml($options['data']->release, FileEntity::TYPE_RELEASE); ?>
            </div>
        <?php endif; ?>

        <?php if (json_decode($options['data']->metakeys)) : ?>
            <div class="metakeys">
                <span class="bold"><?php echo T('Post tags'); ?></span> :
                <?php echo Tag::getHtml($options['data']->metakeys); ?>
            </div>
        <?php endif; ?>

        <?php if ($options['context'] != 'full') : ?>
            <div class="fulllink">
                <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=' . $options['data']->id); ?>"><?php echo T('View full post'); ?></span></a>
            </div>
        <?php endif; ?>

        <div class="cls"></div>
    </div>
<?php endif; ?>