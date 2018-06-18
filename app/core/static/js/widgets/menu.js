(function($) {

    'use strict';

    $.initHeaderMenu = () => {
        let menu = $('.mobile-menu'),
            button = $('.mobile-menu-button');

        button.on('click', () => {
            if (menu.hasClass('open')) {
                menu.removeClass('open');
                return;
            }

            let offset = window.innerWidth - event.pageX - 25;
            menu.css('right', offset).addClass('open');

            return false;
        });

        $(document).on('click', () => {
            menu.removeClass('open');
        });

        $(document).on('keydown', (event) => {
            if (event.which === 27) {
                menu.removeClass('open');
            }
        });
    }

})(jQuery);