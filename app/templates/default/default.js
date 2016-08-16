/**
 * M2 Micro Framework - a micro PHP 5 framework
 *
 * @author      Alexander Chaika <marco.manti@gmail.com>
 * @copyright   2012 Alexander Chaika
 * @link        https://github.com/marco-manti/M2_micro
 * @version     0.3RC4
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
 * Default template js file
 * @package M2 Micro Framework
 * @subpackage Template
 * @author Alexander Chaika
 */

(function($) {

    'use strict';

    $(document).ready(function() {

        $('#mobile-menu-button').click(function(event) {
            var offset = window.innerWidth - event.pageX - 25;
            $('#mobile-menu').css('right', offset + 'px').toggleClass('hidden');
        });

        $('.slider-item.active').width(735).css('opacity', 1);

        $('.slider-item:not(.active) .wrap').live('click', function(e) {
            e.preventDefault();

            $('.slider-item.active')
                .removeClass('active')
                .animate({ width : 100, opacity: 0.7 }, 400);

            $(this).parent('.slider-item')
                .addClass('active')
                .animate({ width: 782, opacity: 1 }, 400);

            return false;
        });

        $('.info .show-tracklist').live('click', function() {
            var post = $(this).closest('.post-item');
            post.find('.info').hide();
            post.find('.tracklist').fadeIn();
        });

        $('.tracklist .hide-tracklist').live('click', function() {
            var post = $(this).closest('.post-item');
            post.find('.tracklist').hide();
            post.find('.info').fadeIn();
        });

        $('#sitemap').find('.open-spoiler').live('click', function() {
            $(this).next('.spoiler').toggle(400);
        });

        var q = $('#query');
        q.autocomplete({
            selectmode  : 'url',
            autosize    : false,
            minsymbols  : 2
        });

        $('#go').click(function(event) {
            if (!q.val()) {
                event.preventDefault();
                q.fadeIn(400);
                return false;
            }
        });
    });
})(jQuery);