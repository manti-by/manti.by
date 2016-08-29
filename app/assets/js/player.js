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
            player_title = player.find('.now-playing span.title-wrapper'),
            player_source = window.player_source,
            player_default_id = window.player_default_id;

        $.fn.checkFaviconState = function () {
            console.log('checkFaviconState');

            var favicon = $('link[rel=icon]');

            if (getCookie('player_is_playing') == 1) {
                favicon.attr('href', '/assets/images/favicon.png');
            } else {
                favicon.attr('href', '/assets/images/favicon-pause.png');
            }
        };

        $.fn.checkPlayerVisibility = function () {
            console.log('checkPlayerVisibility');

            var aside = $('aside'),
                footer = $('footer');

            if (getCookie('player_is_playing') == 1 && aside.hasClass('hidden')) {
                aside.css('bottom', -40).removeClass('hidden').animate({ bottom: 0 }, 800);
            }
        };

        $.fn.checkActivePLayer = function (player_id) {
            console.log('checkActivePLayer');

            $('.player').removeClass('active');
            $('#player, #player-'+ player_id).addClass('active');

            if (getCookie('player_is_playing') == 1) {
                $('#player .play, #player-' + player_id + ' .play').removeClass('play').addClass('pause');
            } else {
                $('#player .pause, #player-' + player_id + ' .pause').removeClass('pause').addClass('play');
            }
        };

        $.fn.resetAllPlayers = function() {
            $('.player:not(.active) .pause').removeClass('pause').addClass('play');
            $('.player:not(.active) .position .progress-line-label span').html('00:00:00');
            $('.player:not(.active) .position .progress-line-loaded').width(0);
            $('.player:not(.active) .position .progress-line-active').width(0);
        };

        $.fn.animatePlayerTitle = function() {
            var overflow = player_link.width() - player_title.outerWidth();

            if (overflow < 0) {
                player_title.animate({ left: overflow }, 2500, function () {
                    setTimeout(function() {
                        player_title.animate({ left: 38 }, 2500);
                    }, 2500);
                });
            }
        };

        $.fn.updateSource = function(id) {
            console.log('updateSource with #' + id);

            // Search source by ID
            var quality, is_mp3;

            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == id) {
                    // Update cookie
                    setCookie('player_id', id);

                    // Check quality
                    quality = getCookie('player_use_hd') == 1 ? 'hd' : 'web';
                    is_mp3  = $.fn.canPlayMp3() ? 'mp3' : 'web';

                    // Update player
                    player.attr('data-release-id', id);
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

            // Update volume label
            player_volume_label.html(volume);
            current_player.find('.volume .progress-line-label span').html(volume);

            // Update volume width
            width = volume * player_volume_line.width() / 100;
            player_volume_line_active.width(width);

            width = volume * current_player.find('.volume .progress-line').width() / 100;
            current_player.find('.volume .progress-line-active').width(width);
        };

        // Progressbar control
        $.fn.updateProgressbarMoving = function(event) {
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

        $.fn.reloadPlayer = function(player_id) {
            console.log('reloadPlayer with #' + player_id);

            $.fn.loaderShow();

            // Restart player with new source
            if (typeof player_api.pause != 'undefined') {
                player_api.pause();
            }

            $.fn.updateSource(player_id);
            player_api.load();

            var player_position = getCookie('player_position') ? getCookie('player_position') : 0;
            if (player_position && player_api.duration) {
                player_api.currentTime = player_api.duration * player_position / 100;
            }

            if (getCookie('player_is_playing') == 1) {
                player_api.play();
            }

            if (getCookie('player_use_hd') == 1) {
                $('#player .high-definition, #player-'+ player_id +' .high-definition').addClass('active');
            }

            $.fn.loaderHide();
        };

        $.fn.playPause = function(event, is_pause) {
            if (is_pause) {
                console.log('Pause action');
            } else {
                console.log('Play action');
            }

            var player_id = $(event.currentTarget).closest('.player').data('release-id'),
                cookie_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;

            if (player_api.readyState == 0 || player_id != cookie_player_id) {
                setCookie('player_position', 0);
                setCookie('player_is_playing', 1);

                $.fn.resetAllPlayers();
                $.fn.reloadPlayer(player_id);
            } else {
                if (is_pause) {
                    setCookie('player_is_playing', 0);
                    player_api.pause();
                } else {
                    setCookie('player_is_playing', 1);
                    player_api.play();
                }
            }

            $.fn.checkActivePLayer(player_id);
            $.fn.checkFaviconState();
            $.fn.checkPlayerVisibility();
        };

        $.fn.changeTrack = function (event, prev) {
            if (prev) {
                console.log('Prev action');
            } else {
                console.log('Next action');
            }

            var player_id = $(event.currentTarget).closest('.player').data('release-id');

            // Check main player
            if (!player_id) {
                player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;
            }

            $.fn.resetAllPlayers();

            setCookie('player_position', 0);

            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id == player_id) {
                    break;
                }
            }

            if (prev) {
                player_id = i > 0 ? player_source[i - 1].id : player_source[player_source.length - 1].id;
            } else {
                player_id = typeof player_source[i + 1] != 'undefined' ? player_source[i + 1].id : player_source[0].id;
            }

            $.fn.reloadPlayer(player_id);
            $.fn.checkActivePLayer(player_id);
            $.fn.checkFaviconState();
            $.fn.checkPlayerVisibility();
        };

        $.fn.initPlayer = function() {
            var player_volume = getCookie('player_volume') ? getCookie('player_volume') : 70,
                player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;

            player_api.volume = player_volume / 100;

            setCookie('player_is_playing', 0);

            player_id = player_id ? parseInt(player_id) : parseInt(player_source[0]['id']);
            $.fn.reloadPlayer(player_id);

            $.fn.checkActivePLayer(player_id);
            $.fn.checkFaviconState();
            $.fn.checkPlayerVisibility();
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
        $('.player .play').live('click', function (event) {
            $.fn.playPause(event, false);
        });

        // Pause action
        $('.player .pause').live('click', function (event) {
            $.fn.playPause(event, true);
        });

        // Next action
        $('.player .next-track').live('click', function (event) {
            $.fn.changeTrack(event, false);
        });

        // Prev action
        $('.player .prev-track').live('click', function (event) {
            $.fn.changeTrack(event, true);
        });

        // Change quality
        $('.player .high-definition').live('click', function () {
            console.log('Change quality');

            var current_player_id = $(this).closest('.player').data('release-id');

            // Check main player
            if (!current_player_id) {
                current_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;
            }

            $.fn.resetAllPlayers();
            $.fn.loaderShow();

            if (getCookie('player_use_hd') == 1) {
                setCookie('player_use_hd', 0);
            } else {
                setCookie('player_use_hd', 1);
            }

            $.fn.reloadPlayer(current_player_id);
            $.fn.checkActivePLayer(current_player_id);
            $.fn.checkFaviconState();
            $.fn.checkPlayerVisibility();
            $.fn.loaderHide();
        });

        player.find('.close').bind('click', function() {
            var aside = $('aside');

            aside.animate({ bottom: -40 }, 800, function () {
                aside.addClass('hidden');
            });

            setCookie('player_is_playing', 0);
            player_api.pause();
        });

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