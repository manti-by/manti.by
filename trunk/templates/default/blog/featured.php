<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Featured block template
     * @name $post-item
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     * @since 0.3RC1
     * @todo Create featured slider
     */

    $active = false;
    $count = 0;
?>
<div id="featured">
    <?php if (count($options['data'])) : ?>
        <ul id="slider">
            <?php foreach($options['data'] as $item) : ?>
                <?php if (json_decode($item->covers)) : ?>
                    <li class="slider-item<?php echo $active ? ' active' : ''; ?>">
                        <div class="wrap">
                            <div class="cover l50">
                                <?php echo File::getHtml($item->covers, FileEntity::TYPE_COVERS); ?>
                            </div>
                            <div class="content r50">
                                <h3><?php echo $item->name; ?></h3>
                                <div class="teaser">
                                    <?php echo nl2br($item->teaser); ?>
                                </div>
                                <?php
                                    // Delete covers and show music info
                                    $item->covers = null;
                                    echo $this->getContents('blog', 'music-block', array('data' => $item));
                                ?>
                            </div>
                            <?php $active = (++$count == 2 ? true : false); ?>
                        </div>
                    </li>
                <?php endif; ?>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('.slider-item.active').width(700).css('opacity', 1);

        $('.slider-item:not(.active) .wrap').live('click', function() {
            $('.slider-item.active').removeClass('active').animate({ width : 100, opacity: 0.7 }, 400);
            $(this).parent('.slider-item').addClass('active').animate({ width: 700, opacity: 1 }, 400);
        });
    });
</script>