<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery item template
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     * @since 0.2RC1
     */
?>
<div class="item">
    <h2><?php echo $options['data']->name; ?></h2>
    <div class="description">
        <?php echo $options['data']->description; ?>
    </div>
    <div class="path">
        <a href="<?php echo $options['data']->path; ?>"><?php echo T('Show'); ?></a>
    </div>
</div>