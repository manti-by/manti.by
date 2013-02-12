<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Full gallery template
     * @name $gallery-full
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
     */

?>
<div id="gallery">
    <h2><?php echo $options['data']->name; ?></h2>
    <div class="description">
        <?php echo $options['data']->description; ?>
    </div>
    <div class="thumbnails">
        <?php foreach ($options['data']->originals as $original) : ?>
            <a href="<?php echo $original->link; ?>" class="thumbnail" rel="<?php echo $original->id; ?>">
                <img src="<?php echo $original->thumbnail; ?>" />
            </a>
        <?php endforeach; ?>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        // Tracker for gallery
        $.post(
            '<?php echo Sef::getSef('index.php?module=gallery&action=track'); ?>',
            { id : <?php echo $options['data']->id; ?> }
        );
    });
</script>

<?php echo $this->getContents('gallery', 'ajax'); ?>