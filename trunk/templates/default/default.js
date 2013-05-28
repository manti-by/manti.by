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

$(document).ready(function() {
    $('.release a').live('click', function() {
        var self = this;
        $.post(
            '/index.php?module=file&action=track',
            { id : $(self).data('file-id') }
        );
    });

    $('audio').bind('canplay', function() {
        var self = this;
        $.post(
            '/index.php?module=file&action=track',
            { id : $(self).data('file-id') }
        );
    });

    $('.content .tracklist .show-tracklist').live('click', function() {
        $(this).hide();
        var release_id = $(this).data('release-id');

        $('.content .hide-tracklist[data-release-id=' + release_id + ']').show();
        $('.content #tracklist-' + release_id).fadeIn();
        $('.content #teaser-' + release_id).hide();
        $('.content #music-block-' + release_id).hide();
    });

    $('.content .tracklist .hide-tracklist').live('click', function() {
        $(this).hide();
        var release_id = $(this).data('release-id');

        $('.content .show-tracklist[data-release-id=' + release_id + ']').show();
        $('.content #tracklist-' + release_id).hide();
        $('.content #teaser-' + release_id).fadeIn();
        $('.content #music-block-' + release_id).fadeIn();
    });

    $('.post-item .tracklist .show-tracklist').live('click', function() {
        $(this).hide();
        var release_id = $(this).data('release-id');

        $('.post-item .hide-tracklist[data-release-id=' + release_id + ']').show();
        $('.post-item #tracklist-' + release_id).fadeIn();
        $('.post-item #teaser-' + release_id).hide();
        $('.post-item #music-block-' + release_id + ' .flip-tracklist').hide();
    });

    $('.post-item .tracklist .hide-tracklist').live('click', function() {
        $(this).hide();
        var release_id = $(this).data('release-id');

        $('.post-item .show-tracklist[data-release-id=' + release_id + ']').show();
        $('.post-item #tracklist-' + release_id).hide();
        $('.post-item #teaser-' + release_id).fadeIn();
        $('.post-item #music-block-' + release_id + ' .flip-tracklist').fadeIn();
    });

    $('#sitemap .open-spoiler').live('click', function() {
        $(this).next('.spoiler').toggle(400);
    });
});