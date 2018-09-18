(($) => {

    'use strict';

    $.initBlogAjax = (tag) => {
        let footer = $('footer'),
            options = {type: 'html', limit: 6},
            start = 6, locked = false;

        if (tag) options['tag'] = tag;
        $(window).on('scroll', () => {
            if (footer.offset().top < $(window).scrollTop() + $(window).height()) {
                if (!locked) {
                    locked = true;
                    options['start'] = start;
                    $.loaderShow();

                    $.get('/api/posts/', options, (response) => {
                        if (response['status'] === 200) {
                            start += 6;
                            for (let post of response['data']) {
                                $('.blog .posts').append(post);
                            }

                            $.initLazyImages();
                            $.player.updateActivePosts();
                            if (response['data'].length) locked = false;
                        } else {
                            DEBUG && console.error(response['message']);
                        }

                        $.loaderHide();
                    });
                }
            }
        });
    }

})(jQuery);