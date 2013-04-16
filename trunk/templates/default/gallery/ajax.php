<?php
    /**
     * M2 Micro Framework - a micro PHP 5 framework
     *
     * @author      Alexander Chaika <marco.manti@gmail.com>
     * @copyright   2012 Alexander Chaika
     * @link        https://github.com/marco-manti/M2_micro
     * @version     0.3
     * @package     M2 Micro Framework
     * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
     *
     * NEW BSD LICENSE
     *
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions are met:
     *  * Redistributions of source code must retain the above copyright
     * notice, this list of conditions and the following disclaimer.
     *  * Redistributions in binary form must reproduce the above copyright
     * notice, this list of conditions and the following disclaimer in the
     * documentation and/or other materials provided with the distribution.
     *  * Neither the name of the "M2 Micro Framework" nor "manti.by" nor the
     * names of its contributors may be used to endorse or promote products
     * derived from this software without specific prior written permission.

     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
     * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
     * DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
     * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
     * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
     * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
     * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
     * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */

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
        // Bind click to thumbnails
        $('.thumbnail').live('click', function(e) {
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

        $(document).live('click', function() {
            $('#image-wrapper').remove();
        });

        buildImage = function(response) {
            if (response.result == 'success') {
                // Create image block
                var image_block = $('<img src="' + response.original + '" class="original resizible black-shadow" rel="' + response.id + '" />');

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
                if (response.message) {
                    var popup_block = $('<div class="error-message">' + response.message + '</div>');
                    $.fn.popupShow(popup_block);
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

        // Check anchor
        var anchor = window.location.hash.substring(1);
        $('a[name=' + anchor + ']').click();

        // Add escape action
        $(document).bind('keydown', function(e) {
            if (e.which == 27) $('#image-wrapper').remove();
        });
    });
</script>
