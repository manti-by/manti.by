<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * User dashboard page
     * @name $dashboard
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<div id="dashboard">
    <ul>
        <li><a href="<?php echo Sef::getSef('index.php?module=blog&action=edit');?>"><?php echo T('Add new post'); ?></a></li>
        <li><a href="<?php echo Sef::getSef('index.php?module=file&action=edit');?>"><?php echo T('View Files'); ?></a></li>
        <li><a class="ajax" href="<?php echo Sef::getSef('index.php?module=gallery&action=updatefiles');?>"><?php echo T('Update gallery items'); ?></a></li>
        <li><a class="ajax" href="<?php echo Sef::getSef('index.php?module=gallery&action=rebuildthumbnails');?>"><?php echo T('Rebuild thumbnails'); ?></a></li>
    </ul>
</div>

