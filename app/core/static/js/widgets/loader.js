(function($) {

    'use strict';

    $(document).ready(function() {
        $.fn.loaderShow = function() {
            $('#loader').addClass('visible');
        };

        $.fn.loaderHide = function() {
            $('#loader').removeClass('visible');
        };
    });

})(jQuery);