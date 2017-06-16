(function($) {

    'use strict';

    $(document).ready(function() {
        var cropper = $('.resizer'),
            height = $(window).height() - ($('header').height() + $('footer').height() + 140);

        if (cropper.get(0)) {
            cropper.css('min-height', height);
        }
    });

})(jQuery);