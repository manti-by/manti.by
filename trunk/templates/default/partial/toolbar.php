<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Toolbar plugin
     * @name $toolbar
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     * @todo Add search functionality
     */

    $user = UserEntity::getInstance();
?>
<script type="text/javascript">
    $(document).ready(function() {
        $('#switch-language').click(function() {
            document.cookie = 'language=' + $(this).attr('rel') + '; path=/; expires=Mon, 01-Jan-2030 00:00:00 GMT';
            location.href = location.href;
        });
    });
</script>
<div id="toolbar">
    <div id="language">
        <?php if (Application::$config['language'] == 'ru') : ?>
            <a href="#switch-to-english" id="switch-language" rel="en">
                <img src="<?php echo Application::$config['http_host']; ?>/assets/images/language-en.png" alt="EN" />
                <?php echo T('English version'); ?>
            </a>
        <?php else : ?>
            <a href="#switch-to-russian" id="switch-language" rel="ru">
                <img src="<?php echo Application::$config['http_host']; ?>/assets/images/language-ru.png" alt="RU" />
                <?php echo T('Russian version'); ?>
            </a>
        <?php endif; ?>
    </div>
    <div id="search">
        <input type="text" id="query" name="q" value="" placeholder="<?php echo T('Search'); ?>..." />
        <input type="button" id="go" name="go" value=" " />
    </div>
</div>
