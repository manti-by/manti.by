"use strict"

const AUDIO_NOT_READY = 0
const AUDIO_LOADED = 4

class Player {
  constructor (data) {
    this.data = data
    this.active = []
    this.is_mp3 = -1
    this.is_playing = false

    this.volume = 70
    this.position = 0
    this.duration = 0

    this.init()
  }

  init () {
    this.player = document.getElementById("player")
    this.player.api = this.player.querySelector("audio")

    this.player.link = this.player.querySelector(".now-playing a")
    this.player.image = this.player.querySelector(".now-playing img")
    this.player.title = this.player.querySelector(".now-playing span.title-wrapper")

    this.volume = getCookie("volume", 70)
    this.is_hd = getCookie("is-hd", false)

    this.updateVolumePosition()
    this.is_hd && this.player.querySelector(".high-definition").classList.add("active")

    this.updateActivePosts()

    let release = this.getData("first")
    if (release) this.active_id = release.id

    this.checkMpegSupport()
    this.bind()
  }

  checkMpegSupport () {
    if (this.is_mp3 === -1) {
      const audio = document.createElement("audio")
      if (typeof audio.canPlayType === "function" && audio.canPlayType("audio/mpeg") !== "") {
        this.is_mp3 = 1
      } else {
        this.is_mp3 = 0
      }
    }
  }

  bind () {
    this.player.api.oncanplay = () => {
      if (this.is_playing) {
        this.player.api.play()
      }
    }

    this.player.api.onended = () => {
      this.next()
    }

    this.player.querySelector(".high-definition").onclick = () => {
      if (this.is_hd === 1) {
        this.is_hd = 0
        this.player.querySelector(".high-definition").classList.remove("active")
      } else {
        this.is_hd = 1
        this.player.querySelector(".high-definition").classList.add("active")
      }

      setCookie("is-hd", this.is_hd)
      this.reload()
    }

    this.player.querySelector(".close").onclick = () => {
      document.querySelector("aside").classList.remove("visible")
      this.pause()
    }

    document.onclick = (event) => {
      let button = event.target.classList

      if (button.contains("next-track")) {
        this.next()
        return
      }

      if (button.contains("prev-track")) {
        this.prev()
        return
      }

      if (button.contains("progress-bar")) {
        this.next()
        this.updatePosition(event)
      }

      if (button.contains("play-pause")) {
        const id = event.target.closest(".player").dataset.id
        if (event.target.classList.contains("play")) {
          if (this.active_id !== id) {
            if (this.getData(id)) {
              this.active_id = id
              this.reload()
            }
          }
          !this.player.dataset.id && this.reload()
          this.play()
        } else {
          this.pause()
        }
        this.updateActivePlayer()
      }
    }

    // document.onmousedown = (event) => {
    //   if (!event.target.classList.contains("progress-bar")) return
    //   event.target.dataset.active = "true"
    // }
    //
    // document.onmousemove = (event) => {
    //   if (!event.target.classList.contains("progress-bar")) return
    //   if (event.target.dataset.active === "true") this.updatePosition(event)
    // }
    //
    // document.onmouseup = (event) => {
    //   if (!event.target.classList.contains("progress-bar")) return
    //   event.target.dataset.active = "false"
    // }
  }

  getData(option) {
    if (!this.data.length) return

    if (option === "first") return this.data[0]

    for (let i = 0; i < this.data.length; i++) {
      switch (option) {
        case "next":
          if (this.data[i].id === this.active_id) {
            if (typeof this.data[i + 1] !== "undefined") {
              return this.data[i + 1]
            } else {
              return this.data[0]
            }
          }
          break
        case "prev":
          if (this.data[i].id === this.active_id) {
            if (typeof this.data[i - 1] !== undefined) {
              return this.data[i - 1]
            } else {
              return this.data[this.active.length - 1]
            }
          }
          break
        case "current":
          if (this.data[i].id === this.active_id) {
            return this.data[i]
          }
          break
        default:
          if (this.data[i].id === parseInt(option)) {
            return this.data[i]
          }
          break
      }
    }

    if (option !== "current") { return this.getData("current") }
    return this.getData("first")
  }

  updateActivePosts() {
    this.active = []

    for (const element of document.querySelectorAll(".post")) {
      let data = this.getData(element.dataset.id)
      this.active.indexOf(data) === -1 && this.active.push(data)
    }

    if (this.active.length === 0) this.active = this.data
  }

  updateProgressPosition () {
    const player_progress_line = this.player.querySelector(".position .progress-line")
    const player_progress_line_active = this.player.querySelector(".position .progress-line-active")
    const player_progress_line_loaded = this.player.querySelector(".position .progress-line-loaded")
    const player_progress_label = this.player.querySelector(".progress-label span")
    const current_player = document.getElementById("#player-" + this.active_id)

    // Skip if not playing or not loaded
    if (this.is_playing !== true || this.player.api.readyState === AUDIO_NOT_READY) return

    // Update internals
    this.duration = this.player.api.duration

    // Update active progress line
    let position = this.player.api.currentTime / this.player.api.duration * 100
    let width = position * player_progress_line.offsetWidth / 100
    player_progress_line_active.offsetWidth = width

    width = position * current_player.querySelector(".position .progress-line").offsetWidth / 100
    current_player.querySelector(".position .progress-line-active").offsetWidth = width

    // Update current player timestamps
    let timestamp = secondsToTime(this.player.api.currentTime)

    player_progress_label.innerHTML = timestamp
    current_player.querySelector(".progress-label span").innerHTML = timestamp

    // Update buffered state
    let buffered = this.player.api.buffered.end(0) / this.duration

    width = buffered * player_progress_line.offsetWidth
    player_progress_line_loaded.offsetWidth = width

    width = buffered * current_player.querySelector(".position .progress-line").offsetWidth
    current_player.querySelector(".position .progress-line-loaded").offsetWidth = width
  }

  updateVolumePosition () {
    const player_volume_line = this.player.querySelector(".volume .progress-line")
    const player_volume_line_active = this.player.querySelector(".volume .progress-line-active")
    const player_volume_label = this.player.querySelector(".volume-label span")

    player_volume_label.innerHTML = this.volume
    player_volume_line_active.style.offsetWidth = this.volume * player_volume_line.style.offsetWidth / 100
  }

  updatePosition (event) {
    const active_width = event.target.querySelector(".progress-line").width()
    const pixels_value = event.clientX - event.target.offsetLeft
    let percent_value = Math.floor(pixels_value / active_width * 100)

    if (event.target.classList.contains("volume")) {
      this.volume = percent_value
      this.player.api.volume = percent_value / 100
      this.updateVolumePosition()
    }

    if (event.target.classList.contains("position")) {
      const loaded_width = event.target.querySelector(".progress-line-loaded").offsetWidth
      if (pixels_value > loaded_width) {
        percent_value = Math.floor(loaded_width / active_width * 100)
      }

      this.player.api.currentTime = this.duration * percent_value / 100
      this.position = percent_value
      this.updateProgressPosition()
    }
  }

  updateActivePlayer () {
    const all_players = document.querySelectorAll(".player")
    const all_play_buttons = document.querySelectorAll(".player .play-pause")
    const active_players = document.querySelectorAll("#player, #player-" + this.active_id)
    const play_buttons = document.querySelectorAll("#player .play-pause, #player-" + this.active_id)

    all_players.classList.remove("active")
    all_play_buttons.classList.remove("pause")
    all_play_buttons.classList.add("play")
    active_players.classList.add("active")

    if (this.is_playing) {
      play_buttons.classList.remove("play")
      play_buttons.classList.add("pause")
    } else {
      play_buttons.classList.remove("pause")
      play_buttons.classList.add("play")
    }
  }

  animatePlayerTitle () {
    const link = this.player.link
    const title = this.player.title
    const overflow = link.innerWidth - title.outerWidth

    if (overflow < 0) {
      title.animate({ left: overflow }, 2500, function () {
        setTimeout(() => {
          title.animate({ left: 42 }, 2500)
        }, 2500)
      })
    }
  }

  reload () {
    window.loader.show()
    if (typeof this.player.api.pause !== "undefined") {
      this.player.api.pause()
    }

    const data = this.getData("current")
    const quality = this.is_hd ? "release" : "preview"
    const format = this.is_mp3 ? "mp3" : "ogg"

    //this.player.title.innerHtml = data.name
    this.player.link.href = data.slug
    this.player.image.src = data.cover.preview
    
    this.player.api.src = data[quality][format]
    this.player.api.dataset.id = this.active_id

    this.player.api.load()

    document.querySelectorAll(".player .position .progress-line-label span").innerHtml = '00:00:00'
    document.querySelectorAll(".player .position .progress-line-loaded").offsetWidth = 0
    document.querySelectorAll(".player .position .progress-line-active").offsetWidth = 0

    window.loader.hide()
  }

  update () {
    if (this.is_playing) {
      this.updateProgressPosition()
    }
  }

  play() {
    this.show()
    this.is_playing = true

    if (this.player.api.readyState === AUDIO_LOADED) {
      this.player.api.play()
    } else {
      this.player.api.load()
    }
  }

  pause() {
    this.is_playing = false

    if (this.player.api.readyState === AUDIO_LOADED) {
      this.player.api.pause()
    }
  }

  next() {
    const data = this.getData('next')
    this.active_id = data.id

    this.reload()
    this.updateActivePlayer()
  }

  prev() {
    const data = this.getData('prev')
    this.active_id = data.id

    this.reload()
    this.updateActivePlayer()
  }

  show() {
    document.querySelector("aside").classList.add("visible")
  }

  hide() {
    document.querySelector("aside").classList.remove("visible")
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.player = new Player([])

  fetch("/api/").then(response => {
    if (response.status === 200) {
      return response.json()
    }
    console.error(response.message)
  }).then(data => {
    window.player.data = data
  })

  setInterval(function () {
    window.player.update()
  }, 1000)

  setInterval(function () {
    window.player.animatePlayerTitle()
  }, 14000)
})