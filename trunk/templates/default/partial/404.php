<?php
    /**
     * 404 page template
     * @name $404
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.2RC2
     */
?>
<div id="page-404" class="wrapper">
    <div class="left-column">404</div>
    <div class="right-column">
        <?php echo Application::$config['not_found_' . Application::$config['language']]; ?>
        <a href="<?php echo Application::$config['http_host']; ?>"><br />
            <?php echo T('Return to homepage'); ?>
        </a>
    </div>
    <div class="cls"></div>
</div>
