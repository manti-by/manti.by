(($) => {
  'use strict'

  const AUDIO_NOT_READY = 0; const AUDIO_LOADED = 4

  class Player {
    constructor () {
      this.data = []
      this.active = []
      this.is_mp3 = 1
      this.is_playing = false

      this.volume = 70
      this.position = 0
      this.duration = 0
    }

    init (data) {
      this.data = data

      this.player = $('#player')
      this.player.audio = this.player.find('audio')
      this.player.api = this.player.audio.get(0)

      this.player.link = this.player.find('.now-playing a')
      this.player.image = this.player.find('.now-playing img')
      this.player.title = this.player.find('.now-playing span.title-wrapper')

      this.volume = $.getCookie('volume', 70)
      this.is_hd = $.getCookie('is-hd', false)

      this.updateVolumePosition()
      this.is_hd && this.player.find('.high-definition').addClass('active')

      this.updateActivePosts()
      this.active_id = this.getData('first').id

      this.bind()
    };

    bind () {
      this.player.api.addEventListener('canplay', () => {
        if (this.is_playing) {
          this.player.api.play()
        }
      })

      this.player.api.addEventListener('ended', () => {
        this.next()
      })

      this.player.find('.high-definition').on('click', () => {
        if (this.is_hd === 1) {
          this.is_hd = 0
          this.player.find('.high-definition').removeClass('active')
        } else {
          this.is_hd = 1
          this.player.find('.high-definition').addClass('active')
        }

        $.setCookie('is-hd', this.is_hd)
        this.reload()
      })

      this.player.find('.close').bind('click', () => {
        $('aside').removeClass('visible')
        this.pause()
      })

      $(document).on('click', '.player .play-pause', (e) => {
        const target = e.currentTarget
        const id = $(target).closest('.player').data('id')

        if ($(target).hasClass('play')) {
          if (this.active_id !== id) {
            if (this.getData(id)) {
              this.active_id = id
              this.reload()
            } else {
              console.error('Audio this.' + id + ' not found')
            }
          }
          !this.player.data('id') && this.reload()
          this.play()
        } else {
          this.pause()
        }
        this.updateActivePlayer()
      })

      $(document).on('click', '.player .next-track', () => {
        this.next()
      })

      $(document).on('click', '.player .prev-track', () => {
        this.prev()
      })

      $(document).on('click', '.player .progress-bar', (e) => {
        this.updatePosition($(e.currentTarget), e)
      })

      $(document).on('mousedown', '.player .progress-bar', (e) => {
        $(e.currentTarget).data('active', true)
      })

      $(document).on('mousemove', '.player .progress-bar', (e) => {
        if ($(e.currentTarget).data('active') === true) {
          this.updatePosition($(e.currentTarget), e)
        }
      })

      $(document).on('mouseup', '.player .progress-bar', (e) => {
        $(e.currentTarget).data('active', false)
      })
    };

    getData (option, full_data) {
      if (!this.data.length) throw 'Audio data is empty'

      let items = this.active
      if (full_data) {
        items = this.data
      }

      if (option === 'first') return items[0]

      for (let i = 0; i < items.length; i++) {
        switch (option) {
          case 'next':
            if (items[i].id === this.active_id) {
              if (typeof items[i + 1] !== 'undefined') {
                return items[i + 1]
              } else {
                return items[0]
              }
            }
            break
          case 'prev':
            if (items[i].id === this.active_id) {
              if (typeof items[i - 1] !== 'undefined') {
                return items[i - 1]
              } else {
                return items[this.active.length - 1]
              }
            }
            break
          case 'current':
            if (items[i].id === this.active_id) {
              return items[i]
            }
            break
          default:
            if (items[i].id === parseInt(option)) {
              return items[i]
            }
            break
        }
      }

      if (option !== 'current') { return this.getData('current') }

      return this.getData('first')
    };

    updateActivePosts () {
      const self = this; let data; let id

      this.active = []
      $.each($('.post'), (index, element) => {
        id = $(element).data('id')
        data = self.getData(id, true)
        this.active.indexOf(data) === -1 && this.active.push(data)
      })

      if (this.active.length === 0) this.active = this.data
    };

    updateProgressPosition () {
      const player_progress_line = this.player.find('.position .progress-line')
      const player_progress_line_active = this.player.find('.position .progress-line-active')
      const player_progress_line_loaded = this.player.find('.position .progress-line-loaded')
      const player_progress_label = this.player.find('.progress-label span')
      const current_player = $('#player-' + this.active_id)
      let position; let width; let timestamp; let buffered

      // Skip if not playing or not loaded
      if (this.is_playing !== true ||
                this.player.audio.get(0).readyState === AUDIO_NOT_READY) return

      // Update internals
      this.duration = this.player.api.duration

      // Update active progress line
      position = this.player.api.currentTime / this.player.api.duration * 100
      width = position * player_progress_line.width() / 100
      player_progress_line_active.width(width)

      width = position * current_player.find('.position .progress-line').width() / 100
      current_player.find('.position .progress-line-active').width(width)

      // Update current player timestamps
      timestamp = $.secondsToTime(this.player.api.currentTime)

      player_progress_label.html(timestamp)
      current_player.find('.progress-label span').html(timestamp)

      // Update buffered state
      buffered = this.player.api.buffered.end(0) / this.duration

      width = buffered * player_progress_line.width()
      player_progress_line_loaded.width(width)

      width = buffered * current_player.find('.position .progress-line').width()
      current_player.find('.position .progress-line-loaded').width(width)
    };

    updateVolumePosition () {
      const player_volume_line = this.player.find('.volume .progress-line')
      const player_volume_line_active = this.player.find('.volume .progress-line-active')
      const player_volume_label = this.player.find('.volume-label span')
      let width

      player_volume_label.html(this.volume)
      width = this.volume * player_volume_line.width() / 100
      player_volume_line_active.width(width)
    };

    updatePosition (element, event) {
      const active_width = element.find('.progress-line').width()
      const pixels_value = event.clientX - element.offset().left
      let percent_value = Math.floor(pixels_value / active_width * 100)

      if (element.hasClass('volume')) {
        this.volume = percent_value
        this.player.api.volume = percent_value / 100
        this.updateVolumePosition()
      }

      if (element.hasClass('position')) {
        const loaded_width = element.find('.progress-line-loaded').width()
        if (pixels_value > loaded_width) {
          percent_value = Math.floor(loaded_width / active_width * 100)
        }

        this.player.api.currentTime = this.duration * percent_value / 100
        this.position = percent_value
        this.updateProgressPosition()
      }
    };

    updateActivePlayer () {
      const all_players = $('.player')
      const all_play_buttons = all_players.find('.play-pause')
      const active_players = $('#player, #player-' + this.active_id)
      const play_buttons = active_players.find('.play-pause')

      all_players.removeClass('active')
      all_play_buttons.removeClass('pause').addClass('play')

      active_players.addClass('active')
      if (this.is_playing) {
        play_buttons.removeClass('play').addClass('pause')
      } else {
        play_buttons.removeClass('pause').addClass('play')
      }
    };

    animatePlayerTitle () {
      const link = this.player.link
      const title = this.player.title
      const overflow = link.width() - title.outerWidth()

      if (overflow < 0) {
        title.animate({ left: overflow }, 2500, function () {
          setTimeout(() => {
            title.animate({ left: 42 }, 2500)
          }, 2500)
        })
      }
    };

    reload () {
      $.loaderShow()
      if (typeof this.player.api.pause !== 'undefined') {
        this.player.api.pause()
      }

      const data = this.getData('current')
      const quality = this.is_hd ? 'release' : 'preview'

      this.player.data('id', this.active_id)
      this.player.title.html(data.title)
      this.player.link.attr('href', data.url)
      this.player.image.attr('src', data.cover)
      this.player.audio.attr('src', data[quality]['mp3'])

      this.player.api.load()

      $('.player .position .progress-line-label span').html('00:00:00')
      $('.player .position .progress-line-loaded').width(0)
      $('.player .position .progress-line-active').width(0)

      $.loaderHide()
    };

    update () {
      if (this.is_playing) {
        this.updateProgressPosition()
      }
    };

    play () {
      this.show()
      this.is_playing = true

      if (this.player.api.readyState === AUDIO_LOADED) {
        this.player.api.play()
      } else {
        this.player.api.load()
      }
    };

    pause () {
      this.is_playing = false

      if (this.player.api.readyState === AUDIO_LOADED) {
        this.player.api.pause()
      }
    };

    next () {
      const data = this.getData('next')
      this.active_id = data.id

      this.reload()
      this.updateActivePlayer()
    };

    prev () {
      const data = this.getData('prev')
      this.active_id = data.id

      this.reload()
      this.updateActivePlayer()
    };

    show () {
      $('aside').addClass('visible')
    };

    hide () {
      $('aside').removeClass('visible')
    };
  }

  $.player = new Player()
})(jQuery)
