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

    $posts = Model::getModel('blog')->getPosts();
?>
<ul class="sidebar">
    <h3><?php echo T('Latest Posts'); ?></h3>
    <?php foreach($posts as $id => $value) : ?>
        <li><a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=' . $id); ?>" title="<?php echo $value; ?>"><?php echo $value; ?></a></li>
    <?php endforeach; ?>
</ul>