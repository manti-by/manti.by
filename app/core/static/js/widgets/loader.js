(function($) {

    'use strict';

    $.initLoader = () => {
        let loader = $('#loader');

        $.loaderShow = () => {
            loader.addClass('visible');
        };

        $.loaderHide = () =>  {
            loader.removeClass('visible');
        };
    };

})(jQuery);