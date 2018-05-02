(function($) {

    'use strict';

    $.fn.initLazyImages = function() {
        $.each($('img.lazy'), function() {
          $(this).attr('src', $(this).attr('data-src'));
          $(this).on('load', function() {
            $(this).removeAttr('data-src');
          });
        });
    }

})(jQuery);