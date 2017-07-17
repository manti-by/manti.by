(function($) {

    'use strict';

    $(document).ready(function() {
        $(document).on('click', '.show-tracklist', function() {
            $(this).closest('.post').find('.info').addClass('hidden');
            $(this).closest('.post').find('.tracklist').removeClass('hidden');
        });

        $(document).on('click', '.hide-tracklist', function() {
            $(this).closest('.post').find('.info').removeClass('hidden');
            $(this).closest('.post').find('.tracklist').addClass('hidden');
        });
    });

})(jQuery);