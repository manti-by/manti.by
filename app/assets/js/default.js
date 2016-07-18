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
 * Default template js file
 * @package M2 Micro Framework
 * @subpackage Template
 * @author Alexander Chaika
 */


function setCookie(name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = name + "=" + value;
}

function getCookie(name) {
    var value = document.cookie;
    var start = value.indexOf(" " + name + "=");

    if (start == -1) {
        start = value.indexOf(name + "=");
    }

    if (start == -1) {
        value = null;
    } else {
        start = value.indexOf("=", start) + 1;
        var end = value.indexOf(";", start);

        if (end == -1) {
            end = value.length;
        }
        value = unescape(value.substring(start,end));
    }

    return value;
}

function secondsToTime(time) {
    var hours = Math.floor(time / 3600);
    hours = hours > 9 ? hours : '0' + hours;
    time -= hours * 3600;

    var minutes = Math.floor(time / 60);
    minutes = minutes > 9 ? minutes : '0' + minutes;
    time -= minutes * 60;

    var seconds = parseInt(time % 60, 10);
    seconds = seconds > 9 ? seconds : '0' + seconds;

    return hours + ':' + minutes + ':' + seconds;
}

$(document).ready(function() {
    // hide message block after 5 seconds
    setTimeout(function() {
        $('#message').fadeOut(400);
    }, 5000);
    
    // hide div block by click
    $('.hide_this').click(function() {
        $(this).parent('div').fadeOut(400);
    });

    // hide div block by click
    $('.accordion').click(function() {
        $(this).next().toggle(400);
    });
});


