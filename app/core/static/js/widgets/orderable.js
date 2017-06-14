(function ($) {

    'use strict';

    $(document).ready(function() {
        var items = $('.orderable'),
            counter, data;

        // Make table sortable
        items.sortable({
            update: function(event, ui) {
                counter = 0;
                data = [];

                $.each(items.find('.orderable-item'), function() {
                    data.push({
                        id: parseInt($(this).data('id')),
                        order: counter++
                    });
                });

                // Send result to DB
                $.post('/api/orderable/', {
                    data: JSON.stringify(data)
                }, function(response) {
                    console.log(response);
                });
            }
        });
    });

})(jQuery);