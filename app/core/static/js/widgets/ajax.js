(function($) {

    'use strict';

    $.fn.initBlogAjax = function() {
        var footer = $('footer'),
            start = 6, limit = 6,
            request;

        $(window).on('scroll', function() {
            if (footer.offset().top < $(window).scrollTop() + $(window).height()) {
                $.fn.loaderShow();
                if (!request || request.readyState === 4) {
                    request = $.get('/api/posts/', {
                        type: 'html',
                        start: start,
                        limit: limit
                    }, function (response) {
                        $.fn.loaderHide();
                        if (response['status'] === 200) {
                            start += limit;
                            for (var i = 0; i < response['data'].length; i++) {
                                $('.blog .posts').append(response['data'][i]);
                            }
                        } else {
                            console.error(response['message']);
                        }
                    });
                }
            }
        });
    }

})(jQuery);