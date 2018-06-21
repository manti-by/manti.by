(function($) {

    'use strict';

    $.initSearch = () => {
        let header = $('header'),
            search = $('section'),
            search_input = $('section input'),
            search_result = $('.search-result'),
            open_button = $('.open-search'),
            close_button = $('.close-search');

        search_input.on('keyup', () => {
            let q = search_input.val(),
                esult_items = '';

            if (q.length > 2) {
                $.get('/api/search', {q : q}, (response) => {
                    if (response.status === 200) {
                        if (response.data.length > 0) {
                            search_result
                                .removeClass('hidden')
                                .width(search_input.width() + 10)
                                .css('top', search_input.position().top + 33)
                                .css('left', search_input.position().left)
                                .html('<ul></ul>');

                            for (let item of response.data) {
                                result_items += '<li><a href="' + item.url + '">' + item.name + '</a></li>'
                            }
                            search_result.find('ul').append(result_items);
                        }
                    }
                });
            }
        });

        search_input.on('click', () => (false));

        open_button.on('click', () => {
            search.addClass('visible');
            header.addClass('hidden');
            return false;
        });

        let close_search = () => {
            search_input.val('');
            search_result.addClass('hidden').html('');
            search.removeClass('visible');
            header.removeClass('hidden');
        };

        close_button.on('click', close_search);
        $(document).on('click', close_search);
    }

})(jQuery);