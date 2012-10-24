/**
  * Default template js file
  * @package M2 Micro Framework
  * @subpackage Template
  * @author Alexander Chaika
  */

$(document).ready(function() {
    // Disable browser autocomplete
    $('.autocomplete').each(function() {
        $(this).attr('autocomplete', 'off');
    });

    // Bind change function
    $('.autocomplete').bind('keyup', function() {
        // Hide previous results
        $('.autocomplete-result').remove();

        // Store self pointer
        var self = this;

        // Get source
        var query = $(self).val();
        var source = $(self).attr('src');

        // Get coords
        var page_x = $(self).offset().left;
        var page_y = $(self).offset().top + $(self).height();

        if (query.length > 2) {
            $.post(source, { q : query }, function(response){
                if (response.result == 'success') {
                    // Show values
                    var html = '<div class="autocomplete-result" style="left:' + page_x + '; top: ' + page_y + ';"><ul>';

                    for (var i = 0; i < response.data.length; i++) {
                        html += '<li class="autocomplete-result-item" rel="' + $(self).attr('id') + '">' + response.data[i] + '</li>';
                    }

                    html += '</ul></div>';
                    $(self).after(html);
                }

                $('.autocomplete-result-item').bind('click', function() {
                    $('#' + $(this).attr('rel')).val($(this).html());
                });

                $('body').bind('click', function() {
                    $('.autocomplete-result').remove();
                });
            });
        }
    });
});