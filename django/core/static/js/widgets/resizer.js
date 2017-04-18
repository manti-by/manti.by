(function($) {

    'use strict';

    $.fn.initPageResizer = function() {
        var cropper = $('.resizer'),
            height = $(window).height() - ($('header').height() + $('footer').height() + 64);

        cropper.css('min-height', height);
    };

})(jQuery);