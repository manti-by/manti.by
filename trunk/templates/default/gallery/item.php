<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery item template
     * @name $blog-item
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.2RC1
     */

    $count = 0;
?>
<div class="item">
    <h2><?php echo $options['data']->name; ?></h2>
    <div class="description">
        <?php echo $options['data']->description; ?>
    </div>
    <div class="thumbnails">
        <?php foreach ($options['data']->originals as $original) : ?>
            <?php
                // Check preview count
                if ($count > Application::$config['preview_count']) break;
                else $count++;
            ?>

            <a href="<?php echo $original->link; ?>" class="thumbnail">
                <img src="<?php echo $original->thumbnail; ?>" />
            </a>
        <?php endforeach; ?>
    </div>
    <div class="path">
        <a href="<?php echo Sef::getSef('index.php?module=gallery&action=show&id=' . $options['data']->id); ?>"><?php echo T('Show all'); ?></a>
    </div>
</div>