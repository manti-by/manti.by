(function($) {

    'use strict';


    $.player = {

        _is_debug: true,
        _is_playing: false,
        _is_hd: false,
        _is_mp3: -1,

        _data: [],
        _player: null,
        _active_id: 0,

        _volume: 70,
        _position: 0,
        _duration: 0,

        init: function(data) {
            this._is_debug && console.log('Init');

            this._data = data;
            this._player = $('#player');

            this._player.audio = this._player.find('audio');
            this._player.api =  this._player.audio.get(0);

            this._player.link = this._player.find('.now-playing a');
            this._player.image = this._player.find('.now-playing img');
            this._player.title = this._player.find('.now-playing span.title-wrapper');

            this._volume = $.fn.getCookie('volume', 70);
            this._is_hd = $.fn.getCookie('is-hd', false);

            this._check_mp3_support();
            this._bind_events();
        },


        _check_mp3_support: function () {
            this._is_debug && console.log('Check mp3 support');

            if (this._is_mp3 === -1) {
                var audio  = document.createElement('audio');
                if (typeof audio.canPlayType === 'function' && audio.canPlayType('audio/mpeg') !== '') {
                    this._is_mp3 = 1;
                } else {
                    this._is_mp3 = 0;
                }
            }
        },


        _bind_events: function() {
            var self = this;

            self._player.audio.on('canplay', function() {
                self._duration = self._player.api.duration;
                if (self._player._is_playing) {
                    self._player.api.play();
                }
            });

            self._player.audio.on('ended', function() {
                self.next();
            });

            $('.player .play').on('click', function() {
                var id = $(this).closest('.player').data('id');

                if (self._active_id !== id) {
                    if (self._get_data(id)) {
                        self._active_id = id;
                    } else {
                        console.error('Audio #' + id + ' not found');
                    }
                }
                self.play();
            });

            $('.player .pause').on('click', function () {
                self.pause();
            });

            $('.player .next-track').on('click', function () {
                self.next();
            });

            $('.player .prev-track').on('click', function () {
                self.prev();
            });

            $('.player .high-definition').on('click', function () {
                self._is_debug && console.log('Change quality');

                self.reset();

                if (self._is_hd === 1) {
                    self._is_hd = 0;
                    $.fn.setCookie('is-hd', 0);
                } else {
                    self._is_hd = 1;
                    $.fn.setCookie('is-hd', 1);

                    $('#player .high-definition, ' +
                      '#player-'+ self._active_id +' .high-definition').addClass('active');
                }

                self.reload();
            });

            self._player.find('.close').bind('click', function() {
                $('aside').removeClass('visible');
                self.pause();
            });

            var progress_bar = $('.player .progressbar');

            progress_bar.on('click', function (event) {
                self.updatePosition($(this), event);
            });

            progress_bar.on('mousedown', function () {
                $(this).data('active', true);
            });

            progress_bar.on('mousemove', function (event) {
                if ($(this).data('active') === true) {
                    self.updatePosition($(this), event);
                }
            });

            progress_bar.on('mouseup', function () {
                $(this).data('active', false);
            });
        },


        _get_data: function (option) {
            for (var i = 0; i < this._data.length; i++) {
                switch(option) {
                    case 'next':
                        if (typeof this._data[i+1] !== 'undefined') {
                            return this._data[i+1];
                        } else {
                            return this._data[0];
                        }
                        break;
                    case 'prev':
                        if (typeof this._data[i-1] !== 'undefined') {
                            return this._data[i-1];
                        } else {
                            return this._data[this._data.length-1];
                        }
                        break;
                    case 'current':
                        if (this._data[i].id === this._active_id) {
                            return this._data[i];
                        }
                        break;
                    default:
                        if (this._data[i].id === parseInt(option)) {
                            return this._data[i];
                        }
                        break;
                }
            }

            if (option !== 'current')
                return this._get_data('current');

            return null;
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


        updateProgressPosition: function () {
            this._is_debug && console.log('updatePlayerProgress');

            var player_progress_line = this._player.find('.position .progress-line'),
                player_progress_line_active = this._player.find('.position .progress-line-active'),
                player_progress_line_loaded = this._player.find('.position .progress-line-loaded'),
                player_progress_label = this._player.find('.position .progress-line-label span');

            var current_player = $('#player-'+ this._active_id),
                position, width;

            // Skip if not plaing or not loaded
            if (this._is_playing === true || this._player.audio.get(0).readyState === 0) return;


            // Update active progress line
            position = this._player.api.currentTime / this._player.api.duration * 100;
            width = position * player_progress_line.width() / 100;
            player_progress_line_active.width(width);

            width = position * current_player.find('.position .progress-line').width() / 100;
            current_player.find('.position .progress-line-active').width(width);


            // Update current player timestamps
            var timestamp = $.fn.secondsToTime(this._player.api.currentTime);

            player_progress_label.html(timestamp);
            current_player.find('.position .progress-line-label span').html(timestamp);


            // Update buffered state
            var buffered = this._player.api.buffered.end(0) / this._duration;

            width = buffered * player_progress_line.width();
            player_progress_line_loaded.width(width);

            width = buffered * current_player.find('.position .progress-line').width();
            current_player.find('.position .progress-line-loaded').width(width);
        },

        updateVolumePosition: function() {
            var player_volume_line = this._player.find('.volume .progress-line'),
                player_volume_line_active = this._player.find('.volume .progress-line-active'),
                player_volume_label = this._player.find('.volume .progress-line-label span'),
                current_player = $('#player-'+ this._active_id),
                width;

            player_volume_label.html(this._volume);
            current_player.find('.volume .progress-line-label span').html(this._volume);

            width = this._volume * player_volume_line.width() / 100;
            player_volume_line_active.width(width);

            width = this._volume * current_player.find('.volume .progress-line').width() / 100;
            current_player.find('.volume .progress-line-active').width(width);
        },


        updatePosition: function(element, event) {
            this._is_debug && console.log('updatePosition');

            var active_width = element.find('.progress-line-active').width(),
                loaded_width = element.find('.progress-line-loaded').width(),
                pixels_value = event.clientX - element.offset().left,
                percent_value = parseInt(active_width / pixels_value * 100);

            if (element.hasClass('volume')) {
                this._volume = percent_value;
                this._player.api.volume = percent_value / 100;
                this.updateVolumePosition();
            }

            if (element.hasClass('position')) {
                if (active_width > loaded_width) {
                    percent_value = parseInt(loaded_width / pixels_value * 100);
                }

                this._position = percent_value;
                this._player.api.currentTime = this._duration * percent_value / 100;
                this.updateProgressPosition();
            }
        },


        resetPlayers: function() {
            this._is_debug && console.log('resetPlayers');

            $('.player').removeClass('active');
            $('.player .pause').removeClass('pause').addClass('play');
            $('.player .position .progress-line-label span').html('00:00:00');
            $('.player .position .progress-line-loaded').width(0);
            $('.player .position .progress-line-active').width(0);
            $('.player .high-definition').removeClass('active');
        },


        updateActivePlayer: function() {
            this._is_debug && console.log('setActivePLayer');

            this.resetPlayers();

            $('#player, #player-'+ this._active_id).addClass('active');
            if (this._is_playing) {
                $('#player .play, #player-' + this._active_id + ' .play')
                    .removeClass('play').addClass('pause');
            } else {
                $('#player .pause, #player-' + this._active_id + ' .pause')
                    .removeClass('pause').addClass('play');
            }
        },


        animatePlayerTitle: function() {
            this._is_debug && console.log('animatePlayerTitle');

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


        reload: function() {
            this._is_debug && console.log('Reload #' + this._active_id);

            $.fn.loaderShow();
            if (typeof this._player.api.pause !== 'undefined') {
                this._player.api.pause();
            }

            var data = this._get_data('current'),
                quality = this._is_hd ? 'release' : 'preview',
                format = this._is_mp3 ? 'mp3' : 'ogg';

            this._player.title.html(data['name']);
            this._player.link.attr('href', data['url']);
            this._player.image.attr('src', data['cover']);
            this._player.audio.attr('src', data[quality][format]);

            this._player.api.load();
            $.fn.loaderHide();
        },


        update: function() {
            this._is_debug && window.show_updates && console.log('Update');

            if (this._is_playing) {
                this.show();
                this.updateFaviconState();
                this.updateProgressPosition();
            }
        },

        play: function() {
            this._is_debug && console.log('Play');

            this.show();
            this._is_playing = true;
            this._player.api.play();
        },

        pause: function() {
            this._is_debug && console.log('Pause');

            this._is_playing = false;
            this._player.api.pause();
        },

        stop: function() {
            this._is_debug && console.log('Stop');

            this._is_playing = false;
            this._player.api.stop();
        },

        next: function() {
            this._is_debug && console.log('Next');

            var data = this._get_data('next');

            this._active_id = data['id'];
            this.reload();

            this.updateActivePlayer();
        },

        prev: function() {
            this._is_debug && console.log('Prev');

            var data = this._get_data('prev');

            this._active_id = data['id'];
            this.reload();

            this.updateActivePlayer();
        },

        show: function() {
            this._is_debug && console.log('Show');

            var aside = $('aside');
            aside.addClass('visible');
        },

        hide: function() {
            this._is_debug && console.log('Hide');

            var aside = $('aside');
            aside.removeClass('visible');
        }

    };
})(jQuery);