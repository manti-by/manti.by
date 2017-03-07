/**
 * Default template js file
 * @package M2 Micro Framework
 * @subpackage Template
 * @author Alexander Chaika
 */

(function($) {

    'use strict';

    $(document).ready(function() {
        // Hide message block after 5 seconds
        setTimeout(function() {
            $('#message').fadeOut(400);
        }, 5000);


        // Hide div block by click
        $('.hide_this').click(function() {
            $(this).parent('div').fadeOut(400);
        });


        // Mobile menu
        var mobile_menu = $('#mobile-menu');

        $('#mobile-menu-button').click(function(event) {
            event.preventDefault();

            var mobile_menu = $('#mobile-menu'),
                offset = window.innerWidth - event.pageX - 25;

            mobile_menu.css('right', offset).toggleClass('hidden');

            return false;
        });

        $(document).bind('click', function() {
            mobile_menu.addClass('hidden');
        });

        $(document).bind('keydown', function(event) {
            if (event.which == 27) {
                mobile_menu.addClass('hidden');
            }
        });


        // Slider
        var window_width = $(window).width(),
            width_full = window_width >= 1200 ? 935 : 735,
            width_crop = window_width >= 1200 ? 120 : 100;

        $('.slider-item.active').width(width_full).css('opacity', 1);

        $('.slider-item:not(.active) .wrap').live('click', function(e) {
            e.preventDefault();

            $('.slider-item.active')
                .removeClass('active')
                .animate({ width : width_crop, opacity: 0.7 }, 400);

            $(this).parent('.slider-item')
                .addClass('active')
                .animate({ width: width_full, opacity: 1 }, 400);

            return false;
        });


        // Tracklist
        $('.info .show-tracklist').live('click', function() {
            var post = $(this).closest('.post-item');
            post.find('.info').hide();
            post.find('.tracklist').fadeIn();
        });

        $('.tracklist .hide-tracklist').live('click', function() {
            var post = $(this).closest('.post-item');
            post.find('.tracklist').hide();
            post.find('.info').fadeIn();
        });


        // Sitemap
        $('#sitemap').find('.open-spoiler').live('click', function() {
            $(this).next('.spoiler').toggle(400);
        });


        // Search
        var query = $('#query');
        query.autocomplete({
            selectmode  : 'url',
            autosize    : false,
            minsymbols  : 2
        });

        var search = $('#search');
        $('#search-link').click(function(event) {
            search.fadeToggle(400);
        });


        // Go to top button
        var go_to_top = $('#gototop');

        $(window).scroll(function() {
            if ($(window).scrollTop() > $(window).height()) {
                go_to_top.fadeIn(400);
            } else {
                go_to_top.fadeOut(400);
            }
        });

        go_to_top.bind('click', function() {
            $('html, body').animate({ scrollTop : 0 });
        });


        // Loader
        $.fn.loaderShow = function() {
            $('#loader').show();
        };

        $.fn.loaderHide = function() {
            $('#loader').hide();
        };


        // Popup message
        var popup = $('#popup');
        $.fn.popupShow = function(data) {
            // Add content to popup
            popup.find('.content').append(data);
            popup.show();

            // Bind autohide for document
            $(document).bind('click', function() {
                $.fn.popupHide();
            });

            // And prevent click on content
            popup.find('.content').bind('click', function(event) {
                if (event.target == this)  {
                    event.preventDefault();
                    return false;
                }
            });
        };

        $.fn.popupHide = function() {
            // Get contents and clear block
            var content = popup.find('.content').html();
            popup.find('.content').html('');

            // Hide block and return previous content
            popup.hide();
            return content;
        };
    });
})(jQuery);