<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery ajax actions
     * @name $gallery-ajax
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
     * @todo fix click for next/prev actions
     */
?>
<script type="text/javascript">
    $(document).ready(function(){
        $('.thumbnail').bind('click', function(e) {
            e.preventDefault();

            // Show loader and get original link
            $.fn.loaderShow();
            var original = $(this).attr('href');
            var rel_id = $(this).attr('rel');

            // Ping view counter
            $.post(
                '<?php echo Sef::getSef('index.php?module=file&action=track'); ?>',
                { id : rel_id }
            );

            // Preload image and show
            var image_block = $('<img src="' + original + '" class="original" rel="' + rel_id + '" />').load(function() {
                $.fn.loaderHide();
                $.fn.popupShow(image_block);
            });

            return false;
        });

        $('.original').live('click', function(e) {
            e.preventDefault();

            // Show loader and get next image
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=gallery&action=next'); ?>',
                { id : $(this).attr('rel') }, buildImage(response)
            );

            return false;
        });

        $('.prev').live('click', function(e) {
            e.preventDefault();

            // Show loader and get next image
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=gallery&action=prev'); ?>',
                { id : $(this).attr('rel') }, buildImage(response)
            );

            return false;
        });

        buildImage = function(response) {
            if (response.result == 'success') {
                var image_block = $('<img src="' + response.original + '" class="original" rel="' + response.id + '" />').load(function() {
                    $.fn.loaderHide();
                    $.fn.popupShow(image_block);

                    // Ping view counter
                    $.post(
                        '<?php echo Sef::getSef('index.php?module=file&action=track'); ?>',
                        { id : response.id }
                    );
                });
            } else {
                var popup_block = $(response.error);
                $.fn.popupShow(popup_block);
            }
        }
    });
</script>
