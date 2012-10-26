<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Sidebar wrapper fo page
     * @name $sidebar-wrapper
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */
?>
<div class="main-sidebar">
    <?php echo $options['body']; ?>
</div>
<div class="right-sidebar">
    <?php echo $this->getContents('plugin', 'sidebar'); ?>
    <?php echo $this->getContents('plugin', 'latest'); ?>
</div>
<div class="cls"></div>
