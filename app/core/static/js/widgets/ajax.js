(function($) {

    'use strict';

    $.fn.initBlogAjax = function(tag) {
        var footer = $('footer'),
            options = {type: 'html', limit: 6},
            start = 6, locked = false;

        if (tag) options['tag'] = tag;
        $(window).on('scroll', function() {
            if (footer.offset().top < $(window).scrollTop() + $(window).height()) {
                if (!locked) {
                    locked = true;
                    options['start'] = start;
                    $.fn.loaderShow();
                    $.get('/api/posts/', options, function (response) {
                        if (response['status'] === 200) {
                            start += 6;
                            for (var i = 0; i < response['data'].length; i++) {
                                $('.blog .posts').append(response['data'][i]);
                            }
                            window.player.updateActivePosts();
                            if (response['data'].length) locked = false;
                        } else {
                            console.error(response['message']);
                        }
                        $.fn.loaderHide();
                    });
                }
            }
        });
    }

})(jQuery);