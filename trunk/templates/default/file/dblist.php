<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Database file list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC3
     */
?>
<h1><?php echo T('Database file list'); ?></h1>
<div id="dblist">
    <?php if (!empty($options['data']) && count($options['data']) > 0) : ?>
        <ul>
            <?php foreach($options['data'] as $id => $name) : ?>
                <li>
                    <input type="checkbox" name="file[<?php echo $id; ?>]" value="1" />
                    <?php echo $name; ?>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else : ?>
        <?php echo T('No files found'); ?>
    <?php endif; ?>
</div>
<a href="<?php echo Sef::getSef('index.php?module=file&action=filesystem'); ?>"><?php echo T('View filesystem'); ?></a>