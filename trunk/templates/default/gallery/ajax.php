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

            // Create image block
            var image_block = $('<img src="' + original + '" class="original" rel="' + rel_id + '" />');

            // Wait while loading and bind click
            image_block.load(buildImageBlock(image_block, rel_id)).bind('click', nextImage);

            return false;
        });

        buildImage = function(response) {
            if (response.result == 'success') {
                // Create image block
                var image_block = $('<img src="' + response.original + '" class="original" rel="' + response.id + '" />');

                // Wait while loading and bind click and track
                image_block.load(buildImageBlock(image_block, response.id)).load(function(){
                    // Ping view counter
                    $.post(
                        '<?php echo Sef::getSef('index.php?module=file&action=track'); ?>',
                        { id : response.id }
                    );
                }).bind('click', nextImage);
            } else {
                if (response.error) {
                    var popup_block = $(response.error);
                    $.fn.popupShow(popup_block);
                } else {
                    $.fn.loaderHide();
                }
            }
        }

        buildImageBlock = function(image_block, rel_id) {
            // Popup blocks
            var next_pointer = $('<div class="next" rel="' + rel_id + '"></div>').bind('click', nextImage);
            var prev_pointer = $('<div class="prev" rel="' + rel_id + '"></div>').bind('click', prevImage);
            var wrapper = $('<div class="image-wrapper"></div>');

            // Build block wrapper and show
            wrapper.append(prev_pointer).append(image_block).append(next_pointer);
            $.fn.popupShow(wrapper);
            $.fn.loaderHide();
        }

        nextImage = function(event) {
            event.preventDefault();

            // Show loader and get next image
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=gallery&action=next'); ?>',
                { id : $(this).attr('rel') }, buildImage
            );

            return false;
        }

        prevImage = function(event) {
            event.preventDefault();

            // Show loader and get next image
            $.fn.loaderShow();
            $.post(
                '<?php echo Sef::getSef('index.php?module=gallery&action=prev'); ?>',
                { id : $(this).attr('rel') }, buildImage
            );

            return false;
        }
    });
</script>
