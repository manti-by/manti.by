(function($) {

    'use strict';

    $(document).ready(function() {
        // Init global widgets
        $.fn.initHeaderMenu();
        $.fn.initFloatingHeader();
        $.fn.initLazyImages();

        // Init player
        $.get('/api/posts', function(response) {
            window.player = $.player;

            if (response['status'] === 200) {
                window.player.init(response['data']);

                setInterval(function() {
                    window.player.update();
                }, 1000);

                setInterval(function() {
                    window.player.animatePlayerTitle();
                }, 14000);
            } else {
                console.error('Error loading player data');
            }
        });
    });

})(jQuery);