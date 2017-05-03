(function($) {

    'use strict';

    $(document).ready(function() {
        $('.show-tracklist').on('click', function() {
            $(this).closest('.post').find('.info').addClass('hidden');
            $(this).closest('.post').find('.tracklist').removeClass('hidden');
        });

        $('.hide-tracklist').on('click', function() {
            $(this).closest('.post').find('.info').removeClass('hidden');
            $(this).closest('.post').find('.tracklist').addClass('hidden');
        });
    });

})(jQuery);