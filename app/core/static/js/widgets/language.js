(function($) {

    'use strict';

    $.fn.initLanguageSwitcher = function() {
        var language = $('.language .item.passive');

        language.on('click', function () {
            $.ajax({
                url: '/language',
                method: 'POST',
                data: {
                    language: $(this).data('id'),
                    csrfmiddlewaretoken: getCookie('csrftoken')
                },
                complete: function(jqXHR, status) {
                    if (status === 'success') {
                        location.reload();
                    }
                }
            });
        });
    }

})(jQuery);