<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Popular block template
     * @name $post-item
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     * @since 0.3RC
     * @todo Create popular list
     */

    $user = UserEntity::getInstance();
?>
<div id="popular">
    Count items <?php echo count($options['data']); ?>
</div>