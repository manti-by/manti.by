<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery list template
     * @name $gallery-list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.2RC1
     */
?>
<h1><?php echo $options['title']; ?></h1>
<div id="gallery">
    <?php echo $options['data']; ?>
</div>

<?php echo $this->getContents('gallery', 'ajax'); ?>
