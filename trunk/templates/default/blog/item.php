<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog post template
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     * @since 0.1
     */
?>
<div class="item">
    <h2>
        <?php echo $options['data']->name; ?>
        <a href="<?php echo Sef::getSef('index.php?module=blog&action=edit&id=' . $options['data']->id); ?>"><?php echo T('Edit'); ?></a>
        <a href="<?php echo Sef::getSef('index.php?module=blog&action=delete&id=' . $options['data']->id); ?>"><?php echo T('Delete'); ?></a>
    </h2>
    <div class="teaser">
        <?php echo $options['data']->teaser; ?>
    </div>
    <div class="description">
        <?php echo $options['data']->description; ?>
    </div>
    <div class="metakeys">
        <?php echo $options['data']->metakeys; ?>
    </div>
    <div class="metadesc">
        <?php echo $options['data']->metadesc; ?>
    </div>
    <?php if ($options['data']->is_music) : ?>
        <div class="covers">
            <?php echo $options['data']->covers; ?>
        </div>
        <div class="preview">
            <?php echo $options['data']->preview; ?>
        </div>
        <div class="release">
            <?php echo $options['data']->release; ?>
        </div>
        <div class="catnum">
            <?php echo $options['data']->catnum; ?>
        </div>
        <div class="genre">
            <?php echo $options['data']->genre; ?>
        </div>
        <div class="length">
            <?php echo $options['data']->length; ?>
        </div>
        <div class="quality">
            <?php echo $options['data']->quality; ?>
        </div>
        <div class="tracklist">
            <?php echo $options['data']->tracklist; ?>
        </div>
    <?php endif; ?>
</div>