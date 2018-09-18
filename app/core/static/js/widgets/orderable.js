(($) => {

    'use strict';

    $.initOrderable = () => {
        let items = $('.orderable'),
            counter, data, length;

        items.sortable({
            update: function(event, ui) {
                counter = 0;
                data = [];
                length = items.find('.orderable-item').length;
                $.each(items.find('.orderable-item'), function() {
                    data.push({
                        id: parseInt($(this).data('id')),
                        order: length - counter
                    });
                    counter++;
                });

                // Send result to DB
                $.post('/api/orderable/', {
                    data: JSON.stringify(data)
                }, function(response) {
                    console.log(response);
                });
            }
        });
    };

})(jQuery);