(function($) {

    'use strict';

    $.initLazyImages = () => {
        let observer = new IntersectionObserver(changes => {
            for (const change of changes) {
                $(change.target).attr('src',
                    $(change.target).attr('data-src'));

                $(change.target).on('load', () => {
                    $(change.target).removeAttr('data-src')
                        .removeClass('lazy');
                });

            }
        });

        $.each($('img.lazy'), (index, target) => {
            observer.observe(target);
        });
    }

})(jQuery);