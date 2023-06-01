(function ($) {
  'use strict'

  $(document).ready(function () {
    let table = $('#result_list').find('tbody')
    let counter
    let data

    // Make table sortable
    table.sortable({
      update: function (event, ui) {
        counter = 0
        data = []

        $.each(table.find('tr'), function () {
          // Update row colors
          $(this).removeClass('row1 row2')
          counter % 2 === 0 ? $(this).addClass('row1') : $(this).addClass('row2')
          counter++

          // Compile update result
          data.push({ id: parseInt($(this).find('.action-select').val()), order: counter })
          $(this).find('.field-order').text(counter)
        })

        // Send result to DB
        $.post('/api/orderable/', {
          data: JSON.stringify(data)
        }, function (response) {
          console.log(response)
        })
      }
    })
  })
})(django.jQuery)
