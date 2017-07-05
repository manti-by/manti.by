(function($) {

    'use strict';

    $(document).ready(function() {
        // Init global widgets
        $.fn.initHeaderMenu();
        $.fn.initFloatingHeader();
        $.fn.initLanguageSwitcher();

        // Init player
        var player = $.player,
            data = [];

        player.init(data);

        setInterval(function() {
            player.update();
        }, 1000);

        setInterval(function() {
            player.animatePlayerTitle();
        }, 14000);
    });

})(jQuery);