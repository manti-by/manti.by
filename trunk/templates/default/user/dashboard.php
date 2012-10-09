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
    </ul>
</div>

