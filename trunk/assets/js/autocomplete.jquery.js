/**
 * M2 Micro Framework - a micro PHP 5 framework
 *
 * @author      Alexander Chaika <marco.manti@gmail.com>
 * @copyright   2012 Alexander Chaika
 * @link        https://github.com/marco-manti/M2_micro
 * @version     0.3
 * @package     M2 Micro Framework
 * @license     https://raw.github.com/marco-manti/M2_micro/manti-by-dev/NEW-BSD-LICENSE
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
 * Autocomplete jQuery plugin
 * @package M2 Micro Framework
 * @subpackage Template
 * @author Alexander Chaika
 */

(function($){
    $.fn.autocomplete = function (options) {
        // Save default options
        var options = options;

        // Process each element
        return this.each(function () {
            // Self pointer
            var self = this;

            // Extend default options
            self.defaults   = { selectmode : 'select', autosize : true, minsymbols : 2 }
            self.options    = $.extend(self.defaults, options);

            // Check keys
            $(self).bind('keyup', function () {
                // Hide previous results
                $('.autocomplete-result').remove();

                // Get source
                var query = $(self).val();
                var source = $(self).data('source');

                // Get coords
                var page_x = $(self).offset().left;
                var page_y = $(self).offset().top + $(self).height();
                var width  = $(self).width();

                // Start if query have more than symbols count in options
                if (query.length > self.options.minsymbols) {
                    $.post(source, { q : query }, function(response){
                        if (response.result == 'success') {
                            // Check autocomplete with empty result set
                            if (response.data.length > 0) {
                                // Show values
                                var pos = 'left:' + page_x + '; top: ' + page_y + ';';

                                // Check autosize option
                                pos += self.options.autosize ? ' width: ' + width + 'px;' : '';

                                // Compile output html
                                var html = '<div class="autocomplete-result" style="' + pos + '"><ul>';
                                for (var i = 0; i < response.data.length; i++) {
                                    html += '<li class="autocomplete-result-item" data-input-id="' + $(self).attr('id') + '">' + response.data[i] + '</li>';
                                }
                                html += '</ul></div>';

                                // Insert result in DOM
                                $(self).after(html);
                            }
                        }

                        // Check select mode
                        $('.autocomplete-result-item').bind('click', function() {
                            if (self.options.selectmode == 'select') {
                                $('#' + $(this).data('input-id')).val($(this).html());
                            }
                        });

                        // Bind close
                        $('body').bind('click', function() {
                            $('.autocomplete-result').remove();
                        });
                    });
                }
            });
        });
    }
})(jQuery);