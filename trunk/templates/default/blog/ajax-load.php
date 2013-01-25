<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Blog category ajax loader
     * @name $blog-ajax-loader
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
     */
?>

<script type="text/javascript">
    $(document).ready(function() {
        var page = <?php echo $options['page']; ?>;
        $(window).scroll(function() {
            if ($('#footer').offset().top < $(window).scrollTop() + $(window).height() && page > 0) {
                $.fn.loaderShow();
                page++;
                $.post('<?php echo Sef::getSef('index.php?module=blog&action=next'); ?>', { page : page }, function(responce) {
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
