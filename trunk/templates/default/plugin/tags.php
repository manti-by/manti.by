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
    <?php foreach($tags as $item) : ?>
        <li><a href="<?php echo Sef::getSef('index.php?module=tag&action=search&id=' . $item->id); ?>" title="<?php echo $item->name; ?>"><?php echo $item->name . ' <span class="tag-counter">(' . $item->count . ')</span>'; ?></a></li>
    <?php endforeach; ?>
</ul>