/**
 * M2 Micro Framework - a micro PHP 5 framework
 *
 * @author      Alexander Chaika <marco.manti@gmail.com>
 * @copyright   2012 Alexander Chaika
 * @link        https://github.com/marco-manti/M2_micro
 * @version     0.3RC4
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

/**
 * Default template js file
 * @package M2 Micro Framework
 * @subpackage Template
 * @author Alexander Chaika
 */

(function($) {

    'use strict';

    $(document).ready(function() {
        var current_image_id = 0;

        // Build image overlay
        $.fn.buildImage = function(id, link) {
            // Remove old image
            var image_wrapper = $('#image-wrapper');
            image_wrapper.remove();

            // Show loader
            $.fn.loaderShow();

            // Try to loading image
            var image = $('<img src="' + link + '" class="original resizible black-shadow" data-image-id="' + id + '" />');

            image.load(function() {
                var close_pointer = $('<div class="close"><i class="material-icons">close</i></div>'),
                    next_pointer = $('<div class="next" data-image-id="' + id + '"><i class="material-icons">chevron_right</i></div>'),
                    prev_pointer = $('<div class="prev" data-image-id="' + id + '"><i class="material-icons">chevron_left</i></div>'),
                    wrapper = $('<div id="image-wrapper"></div>');

                // Bind actions
                image.bind('click', $.fn.nextImage);
                next_pointer.bind('click', $.fn.nextImage);
                prev_pointer.bind('click', $.fn.prevImage);
                close_pointer.bind('click', image_wrapper.remove());

                // Build block wrapper and append to contents
                wrapper.append(close_pointer)
                    .append(prev_pointer)
                    .append(image)
                    .append(next_pointer);

                $('body').append(wrapper);

                // Move image to screen center
                var shift_x = ($(window).width() - image.width()) / 2,
                    shift_y = ($(window).height() - image.height()) / 2;

                if (shift_x > 0) image.css('left', shift_x);
                if (shift_y > 0) image.css('top', shift_y);

                // Ping view counter
                $.post('/index.php?module=file&action=track', { id : id });

                // Hide loader
                $.fn.loaderHide();

                // Move image on resize
                $(window).bind('resize', function () {
                    shift_x = ($(window).width() - image.width()) / 2;
                    shift_y = ($(window).height() - image.height()) / 2;
                    if (shift_x > 0) image.css('left', shift_x);
                    if (shift_y > 0) image.css('top', shift_y);
                });

                // Hide image wrapper on click and escape
                $(document).bind('click', function() {
                    wrapper.remove();
                });

                $(document).bind('keydown', function(event) {
                    if (event.which == 27) {
                        wrapper.remove();
                    }
                });
            });
        };

        $.fn.imageLoaded = function(response) {
            if (response.result == 'success') {
                current_image_id = response.data.id;
                $.fn.buildImage(response.data.id, response.data.fullhd);
            } else {
                if (response.message) {
                    var popup_block = $('<div class="error-message">' + response.message + '</div>');
                    $.fn.popupShow(popup_block);
                } else {
                    $.fn.loaderHide();
                }
            }
        };

        $.fn.nextImage = function(event, id) {
            !id && event.preventDefault();

            // Show loader and get next image
            $.fn.loaderShow();
            $.post('/index.php?module=gallery&action=next', { id : id ? id : $(this).data('image-id') }, $.fn.imageLoaded);

            return false;
        };

        $.fn.prevImage = function(event, id) {
            !id && event.preventDefault();

            // Show loader and get next image
            $.fn.loaderShow();
            $.post('/index.php?module=gallery&action=prev', { id : id ? id : $(this).data('image-id') }, $.fn.imageLoaded);

            return false;
        };

        // Bind click to thumbnails
        $('.preview').live('click', function(event) {
            event.preventDefault();

            // Show loader and get original link
            var link = $(this).attr('href'),
                id = $(this).data('image-id');

            // Create image block
            $.fn.buildImage(id, link);

            return false;
        });

        $(document).bind('keydown', function(event) {
            var image_wrapper = $('#image-wrapper');

            if (event.which == 32) {
                image_wrapper.find('.next').click();
            }
            if (event.which == 8) {
                image_wrapper.find('.prev').click()
            }
        });

        // Check anchor
        var anchor = window.location.hash.substring(1);
        $('#' + anchor).click();
    });
})(jQuery);