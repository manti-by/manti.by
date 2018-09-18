(($) => {

    'use strict';

    $(document).ready(() => {
        // Init global widgets
        $.initLoader();
        $.initLazyImages();

        $.initHeaderMenu();
        $.initHeader();
        $.initSearch();

        // Init player
        $.get('/api/posts', (response) => {
            if (response['status'] === 200) {
                $.player.init(response['data']);

                setInterval(function() {
                    $.player.update();
                }, 1000);

                setInterval(function() {
                    $.player.animatePlayerTitle();
                }, 14000);
            } else {
                console.error('Error loading player data');
            }
        });
    });

})(jQuery);