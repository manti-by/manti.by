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

    $player_contents = json_encode(Model::getModel('file')->getPlayerContent());
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

        // Get main objects
        var player = $('#player audio').get(0);
        var player_source = <?php echo $player_contents; ?>;
        var current_source_id = getCookie('player_current_id') ? getCookie('player_current_id') : player_source[0].id;

        // Update source function
        $.fn.updateSource = function(id) {
            // Search source by ID
            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == id) {
                    var source = player_source[i];
                    break;
                }
            }

            // Get source
            if (getCookie('player_use_hd') == 1) {
                if ($.fn.canPlayMp3()) {
                    var src = source.hd.mp3;
                } else {
                    var src = source.hd.ogg;
                }
            } else {
                if ($.fn.canPlayMp3()) {
                    var src = source.web.mp3;
                } else {
                    var src = source.web.ogg;
                }
            }

            $('#player audio').attr('src', src);
            $('#player .now-playing a').html(source.name);
        }

        // Update players progress bars
        $.fn.updatePlayerProgress = function () {
            // Update position
            var position = getCookie('player_position') ? getCookie('player_position') : 0;

            var width = position * $('#player .position .progress-line').width() / 100;
            $('#player .position .progress-line-active').width(width);

            width = position * $('#player-'+ current_source_id +' .position .progress-line').width() /100;
            $('#player-'+ current_source_id +' .position .progress-line-active').width(width);

            // Set position to cookie
            position = player.currentTime / player.duration * 100;
            setCookie('player_position', position);

            // Update current player timestamps
            var timestamp = secondsToTime(player.currentTime);

            $('#player .position .progress-line-label span').html(timestamp);
            $('#player-'+ current_source_id +' .position .progress-line-label span').html(timestamp);

            // Update buffered state
            var buffered = player.buffered.end(0)  / player.duration;

            width = buffered * $('#player .position .progress-line').width();
            $('#player .position .progress-line-loaded').width(width);

            width = buffered * $('#player-' + current_source_id + ' .position .progress-line').width();
            $('#player-' + current_source_id + ' .position .progress-line-loaded').width(width);
        }

        // Update players volume bars
        $.fn.updatePlayerVolume = function() {
            // Set volume to cookie
            var volume = getCookie('player_volume') ? getCookie('player_volume') : 70;
            setCookie('player_volume', volume);

            // Update volume label
            player.volume = volume / 100;
            $('#player .volume .progress-line-label span').html(volume);
            $('#player-'+ current_source_id +' .volume .progress-line-label span').html(volume);

            // Update volume width
            var width = volume * $('#player .volume .progress-line').width() / 100;
            $('#player .volume .progress-line-active').width(width);

            width = volume * $('#player-'+ current_source_id +' .volume .progress-line').width() / 100;
            $('#player-'+ current_source_id +' .volume .progress-line-active').width(width);
        }

        // Update player source
        $.fn.reloadPlayer = function(id) {
            // Update cookie
            setCookie('player_current_id', id);

            // Show loader
            $.fn.loaderShow();

            // Restart player with new source
            player.pause();
            $.fn.updateSource(id);
            player.load();

            // Check playing state
            if (getCookie('player_is_playing') == 1) {
                player.play();
                $('#player .play, #player-'+ current_source_id +' .play').removeClass('play').addClass('pause');
                $('link[rel=icon]').attr('href', '/templates/default/images/favicon-play.png');
            }

            // Check HD
            if (getCookie('player_use_hd') == 1) {
                $('#player .high-definition, #player-'+ current_source_id +' .high-definition').addClass('active');
            }
        }

        // Init player
        $.fn.initPlayer = function(id) {
            // Update source
            if (getCookie('player_use_hd') == 1) {
                $('#player .high-definition, #player-'+ current_source_id +' .high-definition').addClass('active');
            }
            $.fn.reloadPlayer(id);
        }

        // Reset all players
        $.fn.resetAllPlayers = function() {
            $('.player .pause').removeClass('pause').addClass('play');
            $('link[rel=icon]').attr('href', '/templates/default/images/favicon.png');

            $('.player .position .progress-line-label span').html('00:00:00');
            $('.player .position .progress-line-active').width(0);
        }

        // Init plyer source links
        $.fn.initPlayer(current_source_id);

        // Set on load update position
        $('#player audio').bind('canplay', function() {
            $.fn.updatePlayerProgress();
            $.fn.updatePlayerVolume();
            $.fn.loaderHide();
        });

        // Play action
        $('.player .play').live('click', function () {
            // Reset all players
            $.fn.resetAllPlayers();

            // Bind active state for inline player
            if ($(this).closest('.player').hasClass('inline') && !$(this).closest('.player').hasClass('active')) {
                // Show loader
                $.fn.loaderShow();

                // Reset position
                setCookie('player_position', 0);

                // Update player source
                current_source_id = $(this).closest('.player').data('release-id');
                $.fn.reloadPlayer(current_source_id);
            }

            // Update button and run player
            $('#player .play, #player-'+ current_source_id +' .play').removeClass('play').addClass('pause');
            player.play();

            // Update active state
            $('.player').removeClass('active');
            $('#player, #player-'+ current_source_id).addClass('active');

            // Update cookie and favicon
            setCookie('player_is_playing', 1);
            $('link[rel=icon]').attr('href', '/templates/default/images/favicon-play.png');
        });

        // Pause action
        $('.player .pause').live('click', function () {
            // Reset all players
            $.fn.resetAllPlayers();

            // Update button and pause player
            $('#player .pause, #player-'+ current_source_id +' .pause').removeClass('pause').addClass('play');
            player.pause();

            // Update cookie and favicon
            setCookie('player_is_playing', 0);
            $('link[rel=icon]').attr('href', '/templates/default/images/favicon.png');
        });

        // Next action
        $('.player .next-track').live('click', function () {
            // Reset all players
            $.fn.resetAllPlayers();

            // Reset position
            setCookie('player_position', 0);

            // Search current player source index
            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == current_source_id) {
                    break;
                }
            }

            // Check next id and restart player with new source
            current_source_id = typeof player_source[i + 1] != 'undefined' ? player_source[i + 1].id : player_source[0].id;
            $.fn.reloadPlayer(current_source_id);
        });

        // Prev action
        $('.player .prev-track').live('click', function () {
            // Reset all players
            $.fn.resetAllPlayers();

            // Reset position state
            setCookie('player_position', 0);

            // Search current player source index
            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == current_source_id) {
                    break;
                }
            }

            // Check prev id and restart player with new source
            current_source_id = i > 0 ? player_source[i - 1].id : player_source[player_source.length - 1].id;
            $.fn.reloadPlayer(current_source_id);
        });

        // change quality
        $('.player .high-definition').live('click', function () {
            // Reset all players
            $.fn.resetAllPlayers();

            // Show loader
            $.fn.loaderShow();

            // Update cookie
            if (getCookie('player_use_hd') == 1) {
                setCookie('player_use_hd', 0);
            } else {
                setCookie('player_use_hd', 1);
            }

            // Reload player
            $.fn.reloadPlayer(current_source_id);
        });

        // Progressbar control
        $.fn.updateProgressbar = function(event) {
            // Update progressbar
            var value_px = event.clientX - $(this).offset().left;
            $(this).find('.progress-line-active').width(value_px);

            // Update counter
            var value_pc = parseInt($(this).find('.progress-line-active').width() / $(this).find('.progress-line').width() * 100);

            // Update control progress
            if ($(this).hasClass('position')) {
                player.currentTime = player.duration * value_pc / 100;

                var timestamp = secondsToTime(player.currentTime);
                $('#player .position .progress-line-label span').html(timestamp);
                $('#player-' + current_source_id + ' .position .progress-line-label span').html(timestamp);

                setCookie('player_position', value_pc);
            }

            // Update control volume
            if ($(this).hasClass('volume')) {
                player.volume = value_pc / 100;

                $('#player .volume .progress-line-label span').html(value_pc);
                $('#player-' + current_source_id + ' .volume .progress-line-label span').html(value_pc);

                setCookie('player_volume', value_pc);
            }
        }

        // Progressbars
        $('.player.active .progressbar').live('click', function (event) {
            $(this).updateProgressbar(event);
        });

        $('.player.active .progressbar').live('mousedown', function (event) {
            $(this).data('active', true);
        });

        $('.player.active .progressbar').live('mousemove', function (event) {
            if ($(this).data('active') == true) $(this).updateProgressbar(event);
        });

        $('.player.active .progressbar').live('mouseup', function (event) {
            $(this).data('active', false);
        });

        // End action
        $('#player audio').bind('ended', function() {
            $('#player .next-track').click();
        });

        // Update position progressbar
        setInterval(function() {
            if (!$('#player audio').get(0).paused) {
                $.fn.updatePlayerProgress();
            }
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
    <audio preload="auto" class="hidden"></audio>

    <div class="button prev-track"></div>
    <div class="button play"></div>
    <div class="button next-track"></div>

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
        <div class="progress-line-loaded"></div>
        <div class="progress-line-active"></div>
        <div class="progress-line-label"><span>0</span></div>
    </div>

    <div class="cls"></div>
</div>