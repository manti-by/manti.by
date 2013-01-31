<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Filesystem file list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */
?>
<h1><?php echo $options['title']; ?></h1>
<div id="dblist">
    <?php
        if (!empty($options['data']) && count($options['data']) > 0) {
            echo $this->printDownloadList($options['data']);
        } else {
            echo T('No files found');
        }
    ?>
</div>


