<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog category template
     * @name $blog-list
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.1
     */
?>
<?php if (!empty($options['title'])) : ?>
    <h1><?php echo $options['tile']; ?></h1>
<?php endif; ?>

<?php echo $options['data']; ?>

<script type="text/javascript">
    $(document).ready(function() {
        var page = <?php echo $options['page']; ?>;
        $(window).scroll(function() {
            if ($('#footer').offset().top < $(window).scrollTop() + $(window).height() && page > 0) {
                $.fn.loaderShow();
                page++;
                $.get('<?php echo Sef::getSef('index.php?module=blog&action=next'); ?>' + '&page=' + page, function(responce) {
                    if (responce != '') {
                        $('#content .main-sidebar').append(responce);
                    } else {
                        page = 0;
                    }
                    $.fn.loaderHide();
                });
            }
        });
    });
</script>
