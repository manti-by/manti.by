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

    $player_data = Model::getModel('file')->getPlayerContent();
    $player_source = json_encode($player_data);
    $player_default_id = (int)$player_data[0]['id'];

?>
<script type="text/javascript">
(function($) {

    'use strict';

    $(document).ready(function() {

        // Check mp3 support
        var is_mp3_support = -1;
        $.fn.canPlayMp3 = function () {

            console.log('Check mp3 support');

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
        };

        // Update source function
        var player = $('#player'),
            player_audio = player.find('audio'),
            player_api = player_audio.get(0),
            player_link = player.find('.now-playing a'),
            player_image = player.find('.now-playing img'),
            player_title = player.find('.now-playing span'),
            player_source = <?php echo $player_source; ?>,
            player_default_id = <?php echo $player_default_id; ?>,
            favicon = $('link[rel=icon]');

        $.fn.updateSource = function(id) {
            var quality, is_mp3;

            console.log('updateSource with #' + id);

            // Search source by ID
            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == id) {
                    // Update cookie
                    setCookie('player_id', id);

                    // Check quality
                    quality = getCookie('player_use_hd') == 1 ? 'hd' : 'web';
                    is_mp3  = $.fn.canPlayMp3() ? 'mp3' : 'web';

                    // Update player
                    player_link.attr('href', player_source[i]['link']);
                    player_image.attr('src', player_source[i]['cover']);
                    player_audio.attr('src', player_source[i][quality][is_mp3]);
                    player_title.html(player_source[i]['name']);

                    return;
                }
            }
        };

        // Update players progress bars
        $.fn.updatePlayerProgress = function () {
            var player_progress_line = player.find('.position .progress-line'),
                player_progress_line_active = player.find('.position .progress-line-active'),
                player_progress_line_loaded = player.find('.position .progress-line-loaded'),
                player_progress_label = player.find('.position .progress-line-label span');

            var player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id,
                current_player = $('#player-'+ player_id),
                position, width;

            console.log('updatePlayerProgress for player #' + player_id);

            // Skip if not loaded
            if (player_audio.get(0).readyState === 0) return;

            // Update active progress line
            position = player_api.currentTime / player_api.duration * 100;
            width = position * player_progress_line.width() / 100;
            player_progress_line_active.width(width);

            width = position * current_player.find('.position .progress-line').width() / 100;
            current_player.find('.position .progress-line-active').width(width);

            // Update current player timestamps
            var timestamp = secondsToTime(player_api.currentTime);

            player_progress_label.html(timestamp);
            current_player.find('.position .progress-line-label span').html(timestamp);

            // Update buffered state
            var buffered = player_api.buffered.end(0) / player_api.duration;

            width = buffered * player_progress_line.width();
            player_progress_line_loaded.width(width);

            width = buffered * current_player.find('.position .progress-line').width();
            current_player.find('.position .progress-line-loaded').width(width);

            setCookie('player_position', position);
        };

        // Update players volume bars
        $.fn.updatePlayerVolume = function() {
            var player_volume_line = player.find('.volume .progress-line'),
                player_volume_line_active = player.find('.volume .progress-line-active'),
                player_volume_label = player.find('.volume .progress-line-label span');

            var volume = getCookie('player_volume') ? getCookie('player_volume') : 70,
                player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id,
                current_player = $('#player-'+ player_id),
                width;

            console.log('updatePlayerVolume for player #' + player_id);

            // Update volume label
            player_volume_label.html(volume);
            current_player.find('.volume .progress-line-label span').html(volume);

            // Update volume width
            width = volume * player_volume_line.width() / 100;
            player_volume_line_active.width(width);

            width = volume * current_player.find('.volume .progress-line').width() / 100;
            current_player.find('.volume .progress-line-active').width(width);
        };

        // Update player source
        $.fn.reloadPlayer = function(id) {
            console.log('reloadPlayer with #' + id);

            // Show loader
            $.fn.loaderShow();

            // Restart player with new source
            if (typeof player_api.pause != 'undefined') {
                player_api.pause();
            }

            $.fn.updateSource(id);
            player_api.load();

            // Check playing state
            if (getCookie('player_is_playing') == 1) {
                player_api.play();
                $('#player .play, #player-'+ id +' .play').removeClass('play').addClass('pause');
                favicon.attr('href', '/templates/default/images/favicon-play.png');

                $('aside').removeClass('hidden');
                $('header').addClass('hidden');
            } else {
                favicon.attr('href', '/templates/default/images/favicon.png');
            }

            // Check HD
            if (getCookie('player_use_hd') == 1) {
                $('#player .high-definition, #player-'+ id +' .high-definition').addClass('active');
            }

            // Hide loader
            $.fn.loaderHide();
        };

        // Init player
        $.fn.initPlayer = function() {
            var player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;
            player_id = player_id ? player_id : player_source[0]['id'];
            $.fn.reloadPlayer(player_id);
        };

        // Reset all players
        $.fn.resetAllPlayers = function() {
            favicon.attr('href', '/templates/default/images/favicon.png');

            var aside = $('aside');
            if (aside.hasClass('hidden')) {
                aside.css('top', '-40px').removeClass('hidden').animate({ top: 0 }, 1200);
                $('header').animate({ opacity: 0 }, 800, function() {
                    $(this).addClass('hidden');
                });
            }

            $('.player:not(.active) .pause').removeClass('pause').addClass('play');
            $('.player:not(.active) .position .progress-line-label span').html('00:00:00');
            $('.player:not(.active) .position .progress-line-loaded').width(0);
            $('.player:not(.active) .position .progress-line-active').width(0);
        };

        $.fn.animatePlayerTitle = function() {
            var now_playing = $('#player .now-playing'),
                now_playing_title = $('#player .now-playing a'),
                overflow = now_playing.width() - now_playing_title.width();

            if (overflow < 0) {
                now_playing_title
                    .animate({ left: overflow }, 2500).animate({ opacity: 1 }, 5000)
                    .animate({ left: 0 }, 2500).animate({ opacity: 1 }, 5000);
            }
        };

        // Init player source links
        $.fn.initPlayer();

        // Set on load update position
        player_audio.bind('canplay', function() {
            $.fn.updatePlayerProgress();
            $.fn.updatePlayerVolume();
        });

        // End action
        player_audio.bind('ended', function() {
            player.find('.next-track').click();
        });

        // Play action
        $('.player .play').live('click', function () {
            console.log('Play action');

            var current_player_id = $(this).closest('.player').data('release-id'),
                cookie_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;

            if (player_api.readyState == 0 || current_player_id != cookie_player_id) {
                // Reset position
                setCookie('player_position', 0);

                // Update cookie and favicon
                setCookie('player_is_playing', 1);

                // Update player source
                $.fn.reloadPlayer(current_player_id);

                // Reset all players
                $.fn.resetAllPlayers();
            } else {
                player_api.play();
                setCookie('player_is_playing', 1);

                $('#player .play, #player-'+ current_player_id +' .play').removeClass('play').addClass('pause');
                favicon.attr('href', '/templates/default/images/favicon-play.png');
            }

            // Update active state
            $('.player').removeClass('active');
            $('#player, #player-'+ current_player_id).addClass('active');
        });

        // Pause action
        $('.player .pause').live('click', function () {
            console.log('Pause action');

            var current_player_id = $(this).closest('.player').data('release-id'),
                cookie_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;

            if (cookie_player_id && cookie_player_id != current_player_id) {
                // Reset position
                setCookie('player_position', 0);

                // Update cookie and favicon
                setCookie('player_is_playing', 1);

                // Update player source
                $.fn.reloadPlayer(current_player_id);

                // Reset all players
                $.fn.resetAllPlayers();
            } else {
                // Reset all players
                $.fn.resetAllPlayers();

                // Update button and pause player
                $('#player .pause, #player-'+ current_player_id +' .pause').removeClass('pause').addClass('play');
                player_api.pause();

                // Update cookie and favicon
                setCookie('player_is_playing', 0);
                favicon.attr('href', '/templates/default/images/favicon.png');
            }
        });

        // Next action
        $('.player .next-track').live('click', function () {
            console.log('Next action');

            var current_player_id = $(this).closest('.player').data('release-id');

            // Check main player
            if (!current_player_id) {
                current_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;
            }

            // Reset all players
            $.fn.resetAllPlayers();

            // Reset position
            setCookie('player_position', 0);

            // Search current player source index
            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == current_player_id) {
                    break;
                }
            }

            // Check next id and restart player with new source
            current_player_id = typeof player_source[i + 1] != 'undefined' ? player_source[i + 1].id : player_source[0].id;
            $.fn.reloadPlayer(current_player_id);
        });

        // Prev action
        $('.player .prev-track').live('click', function () {
            console.log('Prev action');

            var current_player_id = $(this).closest('.player').data('release-id');

            // Check main player
            if (!current_player_id) {
                current_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;
            }

            // Reset all players
            $.fn.resetAllPlayers();

            // Reset position state
            setCookie('player_position', 0);

            // Search current player source index
            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == current_player_id) {
                    break;
                }
            }

            // Check prev id and restart player with new source
            current_player_id = i > 0 ? player_source[i - 1].id : player_source[player_source.length - 1].id;
            $.fn.reloadPlayer(current_player_id);
        });

        // Change quality
        $('.player .high-definition').live('click', function () {
            console.log('Change quality');

            var current_player_id = $(this).closest('.player').data('release-id');

            // Check main player
            if (!current_player_id) {
                current_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;
            }

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
            $.fn.reloadPlayer(current_player_id);
        });

        // Progressbar control
        $.fn.updateProgressbarMoving = function(event) {
            console.log('updateProgressbarMoving');

            // Update progressbar
            var value_px = event.clientX - $(this).offset().left;
            $(this).find('.progress-line-active').width(value_px);

            // Update counter
            var max_length = $(this).find('.progress-line-active').width();
            if ($(this).find('.progress-line-active').width() > $(this).find('.progress-line-loaded').width()) {
                max_length = $(this).find('.progress-line-loaded').width();
            }

            var value_pc = parseInt(max_length / $(this).find('.progress-line').width() * 100);

            // Update control progress
            if ($(this).hasClass('position')) {
                player_api.currentTime = player_api.duration * value_pc / 100;
                setCookie('player_position', value_pc);
                $.fn.updatePlayerProgress();
            }

            // Update control volume
            if ($(this).hasClass('volume')) {
                player_api.volume = value_pc / 100;
                setCookie('player_volume', value_pc);
                $.fn.updatePlayerVolume();
            }
        };

        // Progress bars moving behaviour
        var player_progress_bars = $('.player .progressbar');

        player_progress_bars.live('click', function (event) {
            $(this).updateProgressbarMoving(event);
        });

        player_progress_bars.live('mousedown', function (event) {
            $(this).data('active', true);
        });

        player_progress_bars.live('mousemove', function (event) {
            if ($(this).data('active') == true) $(this).updateProgressbarMoving(event);
        });

        player_progress_bars.live('mouseup', function (event) {
            $(this).data('active', false);
        });

        // Update position progressbar
        setInterval(function() {
            $.fn.updatePlayerProgress();
        }, 1000);

        // Scroll player title
        setInterval(function() {
            $.fn.animatePlayerTitle();
        }, 14000);
    });
})(jQuery);
</script>
<div id="player" class="player">
    <audio preload="auto" class="hidden"></audio>

    <div class="controls">
        <div class="button prev-track"></div>
        <div class="button play"></div>
        <div class="button next-track"></div>

        <div class="progressbar position">
            <div class="progress-line"></div>
            <div class="progress-line-loaded"></div>
            <div class="progress-line-active"></div>
            <div class="progress-line-label"><span>0</span></div>
        </div>

        <div class="progressbar volume">
            <div class="progress-line"></div>
            <div class="progress-line-active"></div>
            <div class="progress-line-label"><span>70</span>%</div>
        </div>

        <div class="high-definition">HD</div>
    </div>

    <div class="now-playing">
        <a href="#">
            <img src="#" width="33" height="33" />
            <span></span>
        </a>
    </div>

    <div class="cls"></div>
</div>