(function($) {

    'use strict';

    $.initLazyImages = () => {
        let is_webp = ['chrome', 'opera', 'opera mobile'].indexOf($.browser.name) >= 0,
            has_webp, src;

        let observer = new IntersectionObserver(changes => {
            for (const change of changes) {
                src = $(change.target).attr('data-src');
                has_webp = $(change.target)[0].hasAttribute('data-webp');

                if (has_webp && is_webp)
                    src = $(change.target).attr('data-webp');

                $(change.target).attr('src', src);
                $(change.target).on('load', () => {
                    $(change.target).removeClass('lazy');
                    $(change.target).removeAttr('data-src');
                    has_webp && $(change.target).removeAttr('data-webp');
                });

            }
        });

        $.each($('img.lazy'), (index, target) => {
            observer.observe(target);
        });
    }

})(jQuery);