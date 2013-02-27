<?php
    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Gallery ajax actions
     * @name $gallery-ajax
     * @package M2 Micro Framework
     * @subpackage Template
     * @author Alexander Chaika
     * @since 0.3RC4
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
            image_block.load(function() {
                // Build image block
                buildImageBlock(this, rel_id);

                // Bind next click
                $(this).bind('click', nextImage);
            });

            return false;
        });

        $(document).bind('click', function() {
            $('#image-wrapper').remove();
        });

        buildImage = function(response) {
            if (response.result == 'success') {
                // Create image block
                var image_block = $('<img src="' + response.original + '" class="original resizible" rel="' + response.id + '" />');

                // Wait while loading and bind click and track
                image_block.load(function() {
                    // Build block
                    buildImageBlock(this, response.id);

                    // Bind next click
                    $(this).bind('click', nextImage);

                    // Ping view counter
                    $.post(
                        '<?php echo Sef::getSef('index.php?module=file&action=track'); ?>',
                        { id : response.id }
                    );
                });
            } else {
                if (response.error) {
                    $.fn.popupShow(response.error);
                } else {
                    $.fn.loaderHide();
                }
            }
        }

        buildImageBlock = function(image_block, rel_id) {
            // Remove old image
            $('#image-wrapper').remove();

            // Popup blocks
            var close_pointer = $('<div class="close"></div>').bind('click', $('#image-wrapper').remove());
            var next_pointer = $('<div class="next" rel="' + rel_id + '"></div>').bind('click', nextImage);
            var prev_pointer = $('<div class="prev" rel="' + rel_id + '"></div>').bind('click', prevImage);
            var wrapper = $('<div id="image-wrapper"></div>');

            // Build block wrapper and append to contents
            wrapper.append(close_pointer).append(prev_pointer).append(image_block).append(next_pointer);
            $('#content').append(wrapper);

            // Hide loader
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
