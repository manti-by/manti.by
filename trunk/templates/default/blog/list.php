<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog category template
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<h1><?php echo $options['title']; ?></h1>
<div id="category">
    <?php echo $options['data']; ?>
</div>
