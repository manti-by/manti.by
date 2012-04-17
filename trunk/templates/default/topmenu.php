<?php 
    $config = System::getInstance()->getConfig();
?>
<ul id="topmenu">
    <li><a href="<?php echo $config['http_host']; ?>"><?php echo T('Home'); ?></a></li>
    <li><a href="<?php echo Sef::getSef('index.php?module=blog'); ?>"><?php echo T('Blog'); ?></a></li>
    <li><a href="<?php echo Sef::getSef('index.php?module=blog&action=show&id=1'); ?>"><?php echo T('About'); ?></a></li>
    <li><a href="<?php echo Sef::getSef('index.php?module=contact'); ?>"><?php echo T('Contact'); ?></a></li>
</ul>