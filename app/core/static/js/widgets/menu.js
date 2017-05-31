(function($) {

    'use strict';

    $.fn.initHeaderMenu = function() {
        var menu = $('.mobile-menu'),
            button = $('.mobile-menu-button');

        button.on('click', function() {
            if (menu.hasClass('open')) {
                menu.removeClass('open');
                return;
            }

            var offset = window.innerWidth - event.pageX - 25;
            menu.css('right', offset).addClass('open');

            return false;
        });

        $(document).on('click', function() {
            menu.removeClass('open');
        });

        $(document).on('keydown', function(event) {
            if (event.which === 27) {
                menu.removeClass('open');
            }
        });
    }

})(jQuery);