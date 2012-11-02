<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Sidebar plugin
     * @name $template-index
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */

    $tags = Model::getModel('tag')->getTags();
?>
<ul class="sidebar">
    <h3><?php echo T('Popular Categories'); ?></h3>
    <?php foreach($tags as $id => $value) : ?>
        <li><a href="<?php echo Sef::getSef('index.php?module=tag&action=search&id=' . $id); ?>" title="<?php echo $value; ?>"><?php echo $value; ?></a></li>
    <?php endforeach; ?>
</ul>