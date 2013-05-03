<?php
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

    defined('M2_MICRO') or die('Direct Access to this location is not allowed.');

    /**
     * Player plugin
     * @name $loaderPlugin
     * @author Alexander Chaika a.k.a. Manti
     * @package M2 Micro Framework
     * @subpackage Plugin
     * @since 0.3RC3
     */

    $player = json_encode(Cache::get('player'));
?>
<script type="text/javascript">
    $(document).ready(function() {
        // Check mp3 support
        var is_mp3_support = -1;
        $.fn.canPlayMp3 = function () {
            if (is_mp3_support > -1) {
                return is_mp3_support ? true : false;
            } else {
                var audio  = document.createElement("audio");
                if (typeof audio.canPlayType === "function" && audio.canPlayType("audio/mpeg") !== "") {
                    is_mp3_support = 1;
                    return true;
                } else {
                    is_mp3_support = 0;
                    return false;
                }
            }
        }

        // Set HD source action
        var player_source = JSON.parse($('#player').find('input[name=source]').val());
        $.fn.updateSource = function(index) {
            if ($('#player .high-definition').hasClass('active')) {
                if ($.fn.canPlayMp3()) {
                    var src = player_source[index].hd.mp3;
                } else {
                    var src = player_source[index].hd.ogg;
                }
            } else {
                if ($.fn.canPlayMp3()) {
                    var src = player_source[index].web.mp3;
                } else {
                    var src = player_source[index].web.ogg;
                }
            }

            $('#player audio').attr('src', src);
            $('#player .now-playing a').html(player_source[index].name);
        }

        // Update player source
        $.fn.reloadPlayer = function(id) {
            // Restart player with new source
            $('#player audio').get(0).pause();
            $.fn.updateSource(id);
            $('#player audio').get(0).load();

            // Check playing state
            if (getCookie('is_playing') == 1) {
                $('#player audio').get(0).play();
            }

            // Check position
            $('#player audio').trigger('canplay');
        }

        // Progressbar control
        $.fn.updateProgressbar = function(event) {
            // Update progressbar
            var value_px = event.clientX - $(this).offset().left;
            $(this).find('.progress-line-active').width(value_px);

            // Update counter
            var value_pc = parseInt($(this).find('.progress-line-active').width() / $(this).find('.progress-line').width() * 100);

            // Update control progress
            if ($(this).hasClass('position')) {
                $('#player audio').get(0).currentTime = $('#player audio').get(0).duration * value_pc / 100;
                $(this).find('.progress-line-label span').html(secondsToTime($('#player audio').get(0).currentTime));
                setCookie('position', value_pc);
            }

            // Update control volume
            if ($(this).hasClass('volume')) {
                $('#player audio').get(0).volume = value_pc / 100;
                $(this).find('.progress-line-label span').html(value_pc);
                setCookie('volume', value_pc);
            }
        }

        // Init player
        $.fn.initPlayer = function(current_played) {
            // Update source
            if (getCookie('use_hd') == 1) $('#player .high-definition').addClass('active');
            $.fn.reloadPlayer(current_played);
        }

        // Init plyer source links
        var player_current_id = 0;
        $.fn.initPlayer(player_current_id);

        // Set on load update position
        $('#player audio').bind('canplay', function() {
            // Set position
            var position = getCookie('position') ? getCookie('position') : 0;
            setCookie('position', position);

            $(this).get(0).currentTime = $(this).get(0).duration * position / 100;
            $('#player .position .progress-line-label span').html(secondsToTime($(this).get(0).currentTime));

            position = position * $('#player .position .progress-line').width() /100;
            $('#player .position .progress-line-active').width(position);

            // Set volume
            var volume = getCookie('volume') ? getCookie('volume') : 70;
            setCookie('volume', volume);

            $(this).get(0).volume = volume / 100;
            $('#player .volume .progress-line-label span').html(volume);

            volume = volume * $('#player .volume .progress-line').width() /100;
            $('#player .volume .progress-line-active').width(volume);
        });

        // Play action
        $('.player .play').live('click', function () {
            $(this).removeClass('play').addClass('pause');
            $('#player audio').get(0).play();
            setCookie('is_playing', 1);
        });

        // Pause action
        $('.player .pause').live('click', function () {
            $(this).removeClass('pause').addClass('play');
            $('#player audio').get(0).pause();
            setCookie('is_playing', 0);
        });

        // Next action
        $('.player .next-track').live('click', function () {
            // Reset position state
            setCookie('position', 0);

            // Check next id and restart player with new source
            player_current_id = player_current_id + 1 >= player_source.length ? 0 : player_current_id + 1;
            $.fn.reloadPlayer(player_current_id);
        });

        // Prev action
        $('.player .prev-track').live('click', function () {
            // Reset position state
            setCookie('position', 0);

            // Check prev id and restart player with new source
            player_current_id = player_current_id - 1 < 0 ? player_source.length - 1 : player_current_id - 1;
            $.fn.reloadPlayer(player_current_id);
        });

        // change quality
        $('.player .high-definition').live('click', function () {
            $(this).toggleClass('active');
            $.fn.reloadPlayer(player_current_id);
        });

        // Progressbars
        $('.player .progressbar').live('click', function (event) {
            $(this).updateProgressbar(event);
        });

        $('.player .progressbar').live('mousedown', function (event) {
            $(this).data('active', true);
        });

        $('.player .progressbar').live('mousemove', function (event) {
            if ($(this).data('active') == true) $(this).updateProgressbar(event);
        });

        $('.player .progressbar').live('mouseup', function (event) {
            $(this).data('active', false);
        });

        // Update position progressbar
        setInterval(function() {
            var position = $('#player audio').get(0).currentTime / $('#player audio').get(0).duration * 100;
            $('#player .position .progress-line-label span').html(secondsToTime($('#player audio').get(0).currentTime));

            var position = position * $('#player .position .progress-line').width() /100;
            $('#player .position .progress-line-active').width(position);
            setCookie('position', position);
        }, 1000);

        // Scroll for label
        setInterval(function() {
            if ($('#player .now-playing').width() < $('#player .now-playing a').width()) {
                var length = $('#player .now-playing').width() - $('#player .now-playing a').width();
                $('#player .now-playing a')
                    .animate({ left: length }, 2500)
                    .animate({ opacity: 1 }, 5000)
                    .animate({ left: 0 }, 2500)
                    .animate({ opacity: 1 }, 5000);
            }
        }, 14000);
    });
</script>
<div id="player" class="player">
    <audio preload="none" class="hidden"></audio>
    <input type="hidden" name="source" value='<?php echo $player; ?>' />

    <div class="button play"></div>
    <div class="button next-track"></div>
    <div class="button prev-track"></div>

    <div class="now-playing">
        <a href="#go">Manti - Reach out of the sun</a>
    </div>

    <div class="high-definition">HD</div>

    <div class="progressbar volume">
        <div class="progress-line"></div>
        <div class="progress-line-active"></div>
        <div class="progress-line-label"><span>70</span>%</div>
    </div>

    <div class="progressbar position">
        <div class="progress-line"></div>
        <div class="progress-line-active"></div>
        <div class="progress-line-label"><span>0</span></div>
    </div>

    <div class="cls"></div>
</div>