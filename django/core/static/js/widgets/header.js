(function($) {

    'use strict';

    $.fn.initFloatingHeader = function() {
        var wnd = $(window),
            header = $('header'),
            prev_y = wnd.scrollTop(),
            curr_y = wnd.scrollTop();

        setInterval(function() {
            curr_y = wnd.scrollTop();

            if (prev_y === curr_y) return;

            curr_y < 60 || prev_y > curr_y ?
                header.addClass('visible') : header.removeClass('visible');

            prev_y = curr_y;
        }, 250);
    }

})(jQuery);