(function($) {

    'use strict';

    $.fn.initLazyImages = function() {
        let observer = new IntersectionObserver(changes => {
            for (const change of changes) {
                $(change.target).attr('src', $(change.target).attr('data-src'));
                $(change.target).on('load', function() {
                    $(change.target).removeAttr('data-src');
                });

            }
        });

        $.each($('img.lazy'), function() {
            observer.observe(this);
        });
    }

})(jQuery);