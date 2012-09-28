<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog post template
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     */
?>
<div class="item">
    <h2><?php echo $options['data']->name; ?></h2>
    <div class="description">
        <?php echo $options['data']->description; ?>
    </div>
</div>