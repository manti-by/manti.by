(function($) {

    'use strict';

    $(document).ready(function() {
        // Init global widgets
        $.fn.initHeaderMenu();
        $.fn.initFloatingHeader();
        $.fn.initLanguageSwitcher();

        // Init player
        $.get('/api/posts', function(response) {
            var player = $.player;

            if (response['status'] === 200) {
                player.init(response['data']);

                setInterval(function() {
                    player.update();
                }, 1000);

                setInterval(function() {
                    player.animatePlayerTitle();
                }, 14000);
            } else {
                console.error('Error loading player data');
            }
        });
    });

})(jQuery);