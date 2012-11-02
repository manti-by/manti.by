<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Frontpage template
     * @name $frontpage
     * @author Alexander Chaika
     * @package M2 Micro Framework
     * @subpackage Template
     * @since 0.3RC3
     * @todo Fix other posts out
     */
?>
<div id="frontpage">
    <?php
        $data = array('data' => $options['data']['featured']);
        echo $this->getContents('blog', 'featured', $data);

        $data = array('data' => $options['data']['popular']);
        echo $this->getContents('blog', 'popular', $data);
    ?>

    <div class="main-sidebar">
        <?php
            $options['module'] = 'blog';
            $data = array('data' => $options['data']['content'], 'context' => 'preview');
            echo $this->renderItemsArray($options);
        ?>
    </div>

    <div class="right-sidebar">
        <?php echo $this->getContents('plugin', 'tags'); ?>
        <?php echo $this->getContents('plugin', 'latest'); ?>
    </div>

    <div class="cls"></div>
</div>