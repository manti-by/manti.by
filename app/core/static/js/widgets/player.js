(function($) {

    'use strict';


    $.player = {
        _is_debug: true,
        _is_mp3_support: -1,
        _is_playing: false,

        _player: null,
        _active_id: 0,

        init: function() {
            this._player = $('#player');

            this._player.api =  this._player.audio.get(0);
            this._player.audio = this._player.find('audio');

            this._player.link = this._player.find('.now-playing a');
            this._player.image = this._player.find('.now-playing img');
            this._player.title = this._player.find('.now-playing span.title-wrapper');
        },

        canPlayMp3: function () {
            this._is_debug && console.log('Check mp3 support');

            var is_mp3_support = -1;
            if (this._is_mp3_support > -1) {
                return true;
            } else {
                var audio  = document.createElement('audio');
                if (typeof audio.canPlayType === "function" && audio.canPlayType("audio/mpeg") !== "") {
                    this._is_mp3_support = 1;
                    return true;
                } else {
                    this._is_mp3_support = 0;
                    return false;
                }
            }
        },

        updateFaviconState: function () {
            this._is_debug && console.log('updateFaviconState');

            var favicon = $('link[rel=icon]');
            if (this._is_playing) {
                favicon.attr('href', '/static/img/favicon.png');
            } else {
                favicon.attr('href', '/static/img/favicon-pause.png');
            }
        },

        updateActivePlayer: function() {
            this._is_debug && console.log('setActivePLayer');

            $('.player').removeClass('active');
            $('#player, #player-'+ this._actuve_id).addClass('active');

            if (this._is_playing) {
                $('#player .play, #player-' + this._actuve_id + ' .play')
                    .removeClass('play').addClass('pause');
            } else {
                $('#player .pause, #player-' + this._actuve_id + ' .pause')
                    .removeClass('pause').addClass('play');
            }
        },

        animatePlayerTitle: function() {
            var link = this._player.link,
                title = this._player.title,
                overflow = link.width() - title.outerWidth();

            if (overflow < 0) {
                title.animate({ left: overflow }, 2500, function () {
                    setTimeout(function() {
                        title.animate({ left: 38 }, 2500);
                    }, 2500);
                });
            }
        },

        resetPlayers: function() {
            $('.player .pause').removeClass('pause').addClass('play');
            $('.player .position .progress-line-label span').html('00:00:00');
            $('.player .position .progress-line-loaded').width(0);
            $('.player .position .progress-line-active').width(0);
        },

        bindEvents: function() {

            player_audio.bind('canplay', function() {
                $.fn.updatePlayerProgress();
                $.fn.updatePlayerVolume();
            });

            // End action
            player_audio.bind('ended', function() {
                player.find('.next-track').click();
            });

            $('.player .play').on('click', function (event) {
                $.fn.playPause(event, false);
            });

            $('.player .pause').on('click', function (event) {
                $.fn.playPause(event, true);
            });

            $('.player .next-track').on('click', function (event) {
                $.fn.changeTrack(event, false);
            });

            $('.player .prev-track').on('click', function (event) {
                $.fn.changeTrack(event, true);
            });

            $('.player .high-definition').on('click', function () {
                console.log('Change quality');

                var current_player_id = $(this).closest('.player').data('release-id');

                // Check main player
                if (!current_player_id) {
                    current_player_id = getCookie('player_id') ? getCookie('player_id') : player_default_id;
                }

                $.fn.resetAllPlayers();
                $.fn.loaderShow();

                if (getCookie('player_use_hd') === 1) {
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

                if ($(window).width() > 1024) {
                    aside.animate({ bottom: -46 }, 800, function () {
                        aside.addClass('hidden');
                    });
                } else {
                    aside.animate({ top: -46 }, 800, function () {
                        aside.addClass('hidden');
                    });
                }

                setCookie('player_is_playing', 0);
                player_api.pause();
            });

            var player_progress_bars = $('.player .progressbar');

            player_progress_bars.on('click', function (event) {
                $(this).updateProgressbarMoving(event);
            });

            player_progress_bars.on('mousedown', function (event) {
                $(this).data('active', true);
            });

            player_progress_bars.on('mousemove', function (event) {
                if ($(this).data('active') === true) {
                    $(this).updateProgressbarMoving(event);
                }
            });

            player_progress_bars.on('mouseup', function (event) {
                $(this).data('active', false);
            });
        },

        update: function() {
            this._is_debug && console.log('Update');

            if (this._is_playing) {
                this.show();
            }

            this.updateFaviconState();
        },

        play: function() {
            this._is_debug && console.log('Play');
        },

        stop: function() {
            this._is_debug && console.log('Stop');
        },

        show: function() {
            this._is_debug && console.log('Show');

            var aside = $('aside');
            aside.addClass('visible');
        },

        hide: function() {
            this._is_debug && console.log('hide');

            var aside = $('aside');
            aside.removeClass('visible');
        }

    };

    $(document).ready(function() {

        // Update source function
        var player = $('#player'),
            player_audio = player.find('audio'),
            player_api = player_audio.get(0),
            player_link = player.find('.now-playing a'),
            player_image = player.find('.now-playing img'),
            player_title = player.find('.now-playing span.title-wrapper'),
            player_source = window.player_source,
            player_default_id = window.player_default_id;



        $.fn.updateSource = function(id) {
            console.log('updateSource with #' + id);

            // Search source by ID
            var quality, is_mp3;

            for (var i = 0; i < player_source.length; i++) {
                if (player_source[i].id === id) {
                    // Update cookie
                    setCookie('player_id', id);

                    // Check quality
                    quality = getCookie('player_use_hd') === 1 ? 'hd' : 'web';
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