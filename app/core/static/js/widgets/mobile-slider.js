(function($) {

    'use strict';

    let active = 0,
        slider = $('#featured-slider');

    let nextSlide = () => {
        let width = slider.width() / 3;
        slider.css('left', ((active + 1) * 100) + 'px');
    };

    let prevSlide = () => {
        let width = slider.width() / 3;
        slider.css('left', ((active - 1) * width) + 'px');
    };

    $.initMobileSlider = () => {
        slider.on('swipe', (event) => {
            let offset = event.swipestop.coords[0] - event.swipestart.coords[0];
            offset < 0 ? prevSlide() : nextSlide();
        });

        slider.find('.controls .button').on('click', (event) => {
            let is_next = $(event.currentTarget).hasClass('next');
            is_next ? nextSlide() : prevSlide();
        });
    }

})(jQuery);