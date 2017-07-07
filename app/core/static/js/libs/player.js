(function($) {

    'use strict';

    var AUDIO_NOT_READY = 0, AUDIO_LOADED = 4;

    $.player = {

        _is_debug: true,
        _is_playing: false,
        _is_hd: false,
        _is_mp3: -1,

        _data: [],
        _active: [],
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

            this.updateVolumePosition();
            this._is_hd && this._player.find('.high-definition').addClass('active');

            this.updateActivePosts();
            this._active_id = this._get_data('first')['id'];

            this.reload();
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
                if (self._is_playing) {
                    self._player.api.play();
                }
            });

            self._player.audio.on('ended', function() {
                self.next();
            });

            $('.player .play-pause').on('click', function() {
                var id = $(this).closest('.player').data('id');

                if ($(this).hasClass('play')) {
                    if (self._active_id !== id) {
                        if (self._get_data(id)) {
                            self._active_id = id;
                            self.reload();
                        } else {
                            console.error('Audio #' + id + ' not found');
                        }
                    }
                    self.play();
                } else {
                    self.pause();
                }
                self.updateActivePlayer();
            });

            $('.player .next-track').on('click', function () {
                self.next();
            });

            $('.player .prev-track').on('click', function () {
                self.prev();
            });

            $('.player .high-definition').on('click', function () {
                self._is_debug && console.log('Change quality');

                if (self._is_hd === 1) {
                    self._is_hd = 0;
                    self._player.find('.high-definition').removeClass('active');
                } else {
                    self._is_hd = 1;
                    self._player.find('.high-definition').addClass('active');
                }

                $.fn.setCookie('is-hd', self._is_hd);
                self.reload();
            });

            self._player.find('.close').bind('click', function() {
                $('aside').removeClass('visible');
                self.pause();
            });

            var progress_bar = $('.player .progress-bar');

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


        _get_data: function (option, full_data) {
            if (!this._data.length) throw 'Audio data is empty';

            var items = this._active;
            if (full_data) {
                items = this._data;
            }

            if (option === 'first') return items[0];

            for (var i = 0; i < items.length; i++) {
                switch(option) {
                    case 'next':
                        if (items[i].id === this._active_id) {
                            if (typeof items[i + 1] !== 'undefined') {
                                return items[i + 1];
                            } else {
                                return items[0];
                            }
                        }
                        break;
                    case 'prev':
                        if (items[i].id === this._active_id) {
                            if (typeof items[i - 1] !== 'undefined') {
                                return items[i - 1];
                            } else {
                                return items[this._active.length - 1];
                            }
                        }
                        break;
                    case 'current':
                        if (items[i].id === this._active_id) {
                            return items[i];
                        }
                        break;
                    default:
                        if (items[i].id === parseInt(option)) {
                            return items[i];
                        }
                        break;
                }
            }

            if (option !== 'current')
                return this._get_data('current');

            return this._get_data('first');
        },

        updateActivePosts: function() {
            var self = this, data, id;

            self._active = [];
            $.each($('.post'), function() {
                id = $(this).data('id');
                data = self._get_data(id, true);
                self._active.indexOf(data) === -1 && self._active.push(data);
            });
        },


        updateProgressPosition: function () {
            var player_progress_line = this._player.find('.position .progress-line'),
                player_progress_line_active = this._player.find('.position .progress-line-active'),
                player_progress_line_loaded = this._player.find('.position .progress-line-loaded'),
                player_progress_label = this._player.find('.progress-label span'),
                current_player = $('#player-'+ this._active_id),
                position, width, timestamp, buffered;

            // Skip if not plaing or not loaded
            if (this._is_playing !== true ||
                this._player.audio.get(0).readyState === AUDIO_NOT_READY) return;

            // Update active progress line
            position = this._player.api.currentTime / this._player.api.duration * 100;
            width = position * player_progress_line.width() / 100;
            player_progress_line_active.width(width);

            width = position * current_player.find('.position .progress-line').width() / 100;
            current_player.find('.position .progress-line-active').width(width);

            // Update current player timestamps
            timestamp = $.fn.secondsToTime(this._player.api.currentTime);

            player_progress_label.html(timestamp);
            current_player.find('.progress-label span').html(timestamp);

            // Update buffered state
            buffered = this._player.api.buffered.end(0) / this._duration;

            width = buffered * player_progress_line.width();
            player_progress_line_loaded.width(width);

            width = buffered * current_player.find('.position .progress-line').width();
            current_player.find('.position .progress-line-loaded').width(width);
        },

        updateVolumePosition: function() {
            var player_volume_line = this._player.find('.volume .progress-line'),
                player_volume_line_active = this._player.find('.volume .progress-line-active'),
                player_volume_label = this._player.find('.volume-label span'),
                current_player = $('#player-'+ this._active_id),
                width;

            player_volume_label.html(this._volume);
            current_player.find('.volume-label span').html(this._volume);

            width = this._volume * player_volume_line.width() / 100;
            player_volume_line_active.width(width);

            width = this._volume * current_player.find('.volume .progress-line').width() / 100;
            current_player.find('.volume .progress-line-active').width(width);
        },


        updatePosition: function(element, event) {
            var active_width = element.find('.progress-line-active').width(),
                loaded_width = element.find('.progress-line-loaded').width(),
                pixels_value = event.clientX - element.offset().left,
                percent_value = parseInt(pixels_value / active_width * 100);

            if (element.hasClass('volume')) {
                this._volume = percent_value;
                this._player.api.volume = percent_value / 100;
                this.updateVolumePosition();
            }

            if (element.hasClass('position')) {
                if (active_width > loaded_width) {
                    percent_value = parseInt(pixels_value / loaded_width * 100);
                }

                this._position = percent_value;
                this._player.api.currentTime = this._duration * percent_value / 100;
                this.updateProgressPosition();
            }
        },


        resetPlayers: function() {
            this._is_debug && console.log('resetPlayers');

            $('.player').removeClass('active');
            $('.player .play-pause').removeClass('pause').addClass('play');
            $('.player .position .progress-line-label span').html('00:00:00');
            $('.player .position .progress-line-loaded').width(0);
            $('.player .position .progress-line-active').width(0);
            $('.player .high-definition').removeClass('active');
        },


        updateActivePlayer: function() {
            this._is_debug && console.log('setActivePLayer');

            var play_button = $('#player .play-pause, #player-' + this._active_id + ' .play-pause');

            $('#player, #player-'+ this._active_id).addClass('active');
            if (this._is_playing) {
                play_button.removeClass('play').addClass('pause');
            } else {
                play_button.removeClass('pause').addClass('play');
            }
        },


        animatePlayerTitle: function() {
            var link = this._player.link,
                title = this._player.title,
                overflow = link.width() - title.outerWidth();

            if (overflow < 0) {
                title.animate({ left: overflow }, 2500, function () {
                    setTimeout(function() {
                        title.animate({ left: 42 }, 2500);
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

            this._player.data('id', this._active_id);
            this._player.title.html(data['title']);
            this._player.link.attr('href', data['url']);
            this._player.image.attr('src', data['cover']);
            this._player.audio.attr('src', data[quality][format]);

            this._player.api.load();
            $.fn.loaderHide();
        },


        update: function() {
            if (this._is_playing) {
                this.updateProgressPosition();
            }
        },


        play: function() {
            this._is_debug && console.log('Play');

            this.show();
            this._is_playing = true;

            if (this._player.api.readyState === AUDIO_LOADED) {
                this._player.api.play();
            } else {
                this._player.api.load();
            }
        },


        pause: function() {
            this._is_debug && console.log('Pause');

            this._is_playing = false;

            if (this._player.api.readyState === AUDIO_LOADED) {
                this._player.api.pause();
            }
        },


        next: function() {
            this._is_debug && console.log('Next');

            var data = this._get_data('next');

            this._active_id = data['id'];
            this.reload();

            this.resetPlayers();
            this.updateActivePlayer();
        },


        prev: function() {
            this._is_debug && console.log('Prev');

            var data = this._get_data('prev');

            this._active_id = data['id'];
            this.reload();

            this.resetPlayers();
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