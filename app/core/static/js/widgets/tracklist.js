(function($) {

    'use strict';

    $.initTracklist = () => {
        $(document).on('click', '.show-tracklist', () => {
            $(this).closest('.data')
                .find('.info').addClass('hidden');

            $(this).closest('.data')
                .find('.tracklist').removeClass('hidden');
        });

        $(document).on('click', '.hide-tracklist', () => {
            $(this).closest('.data')
                .find('.info').removeClass('hidden');

            $(this).closest('.data')
                .find('.tracklist').addClass('hidden');
        });
    }

})(jQuery);