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
    <?php if (count($options['data'])) : ?>
        <ul id="rollover">
            <?php foreach ($options['data'] as $item) : ?>
                <li class="rollover-item">
                    <?php if (json_decode($item->covers)) : ?>
                        <div class="cover">
                            <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=' . $item->id); ?>">
                                <?php echo File::getHtml($item->covers, FileEntity::TYPE_COVERS); ?>
                            </a>
                        </div>
                    <?php endif; ?>
                    <div class="content">
                        <h3><?php echo $item->name; ?></h3>
                        <div class="fulllink">
                            <a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=' . $item->id); ?>"><?php echo T('View full post'); ?></a>
                        </div>
                    </div>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>
</div>