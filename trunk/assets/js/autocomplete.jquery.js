/**
 * M2 Micro Framework - a micro PHP 5 framework
 *
 * @author      Alexander Chaika <marco.manti@gmail.com>
 * @copyright   2012 Alexander Chaika
 * @link        https://github.com/marco-manti/M2_micro
 * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
 * @version     0.3
 * @package     M2 Micro Framework
 *
 * NEW BSD LICENSE
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *  * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *  * Neither the name of the "M2 Micro Framework" nor "manti.by" nor the
 * names of its contributors may be used to endorse or promote products
 * derived from this software without specific prior written permission.

 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
                    // #43634465 - Fix autocomplete with empty result set
                    if (response.data.length > 0) {
                        // Show values
                        var html = '<div class="autocomplete-result" style="left:' + page_x + '; top: ' + page_y + ';"><ul>';

                        for (var i = 0; i < response.data.length; i++) {
                            html += '<li class="autocomplete-result-item" rel="' + $(self).attr('id') + '">' + response.data[i] + '</li>';
                        }

                        html += '</ul></div>';
                        $(self).after(html);
                    }
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