(function ($) {

    'use strict';

    $(document).ready(function() {
        var table = $('#result_list').find('tbody'),
            counter, data;

        table.sortable({
            update: function(event, ui) {
                counter = 0;
                data = [];

                $.each(table.find('tr'), function() {
                    // Update row colors
                    $(this).removeClass('row1 row2');
                    counter % 2 === 0 ? $(this).addClass('row1') : $(this).addClass('row2');
                    counter++;

                    // Compile update result
                    data.push({ id: parseInt($(this).find('.action-select').val()), order: counter });
                    $(this).find('.field-order').text(counter);
                });

                // Send result to DB
                $.post('/api/images/', { data: JSON.stringify(data) }, function(response) {
                    console.log(response);
                });
            }
        });
    });

})(django.jQuery);