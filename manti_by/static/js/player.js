"use strict"

const AUDIO_NOT_READY = 0
const AUDIO_LOADED = 4

class Player {
  constructor(data) {
    this.data = data
    this.active = []
    this.is_mp3 = -1
    this.is_playing = false

    this.volume = 70
    this.position = 0
    this.duration = 0

    this.init()
  }

  init() {
    this.player = document.getElementById("player")
    this.api = this.player.querySelector("audio")

    this.link = this.player.querySelector(".now-playing a")
    this.image = this.player.querySelector(".now-playing img")
    this.title = this.player.querySelector(".now-playing .title-wrapper")

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

  checkMpegSupport() {
    if (this.is_mp3 === -1) {
      const audio = document.createElement("audio")
      if (typeof audio.canPlayType === "function" && audio.canPlayType("audio/mpeg") !== "") {
        this.is_mp3 = 1
      } else {
        this.is_mp3 = 0
      }
    }
  }

  bind() {
    this.api.oncanplay = () => {
      if (this.is_playing) {
        this.api.play()
      }
    }

    this.api.onended = () => {
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
              this.active_id = parseInt(id)
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

    document.onmousedown = (event) => {
      if (!event.target.classList.contains("progress-bar")) return
      event.target.dataset.active = "true"
    }

    document.onmousemove = (event) => {
      if (!event.target.classList.contains("progress-bar")) return
      if (event.target.dataset.active === "true") this.updatePosition(event)
    }

    document.onmouseup = (event) => {
      if (!event.target.classList.contains("progress-bar")) return
      event.target.dataset.active = "false"
    }
  }

  getData(option) {
    if (!this.active.length) return

    let target_id

    if (option === "first") target_id = this.active[0]
    if (option === "current") target_id = this.active_id
    if (Number.isInteger(parseInt(option))) target_id = parseInt(option)

    const index = this.active.indexOf(this.active_id)
    if (index !== -1) {
      if (option === "next" && typeof this.active[index + 1] !== "undefined") {
        target_id = this.active[index + 1]
      }
      if (option === "prev" && typeof this.active[index - 1] !== "undefined") {
        target_id = this.active[index - 1]
      }
      if (typeof target_id === "undefined") target_id = this.active[0]
    }

    return this.data[target_id]
  }

  updateActivePosts() {
    this.active = []
    for (const element of document.querySelectorAll(".post")) {
      this.active.push(element.dataset.id)
    }
  }

  updateProgressPosition() {
    const player_progress_line = this.player.querySelector(".position .progress-line")
    const player_progress_line_active = this.player.querySelector(".position .progress-line-active")
    const player_progress_line_loaded = this.player.querySelector(".position .progress-line-loaded")
    const player_progress_label = this.player.querySelector(".progress-label span")
    const current_player = document.getElementById("player-" + this.active_id)

    // Skip if not playing or not loaded
    if (this.is_playing !== true || this.api.readyState === AUDIO_NOT_READY) return

    // Update internals
    this.duration = this.api.duration

    // Update active progress line
    let position = this.api.currentTime / this.api.duration * 100
    let width = position * player_progress_line.style.width / 100
    player_progress_line_active.style.width = width + "px"

    width = position * current_player.querySelector(".position .progress-line").style.width / 100
    current_player.querySelector(".position .progress-line-active").style.width = width + "px"

    // Update current player timestamps
    let timestamp = secondsToTime(this.api.currentTime)

    player_progress_label.innerHTML = timestamp
    current_player.querySelector(".progress-label span").innerHTML = timestamp

    // Update buffered state
    let buffered = this.api.buffered.end(0) / this.duration

    width = buffered * player_progress_line.offsetWidth
    player_progress_line_loaded.style.width = width + "px"

    width = buffered * current_player.querySelector(".position .progress-line").offsetWidth
    current_player.querySelector(".position .progress-line-loaded").style.width = width + "px"
  }

  updateVolumePosition() {
    const player_volume_line = this.player.querySelector(".volume .progress-line")
    const player_volume_line_active = this.player.querySelector(".volume .progress-line-active")
    const player_volume_label = this.player.querySelector(".volume-label span")

    player_volume_label.innerHTML = this.volume
    player_volume_line_active.style.offsetWidth = this.volume * player_volume_line.style.offsetWidth / 100
  }

  updatePosition(event) {
    const active_width = event.target.querySelector(".progress-line").offsetWidth
    const pixels_value = event.clientX - event.target.offsetLeft
    let percent_value = Math.floor(pixels_value / active_width * 100)

    if (event.target.classList.contains("volume")) {
      this.volume = percent_value
      this.api.volume = percent_value / 100
      this.updateVolumePosition()
    }

    if (event.target.classList.contains("position")) {
      const loaded_width = event.target.querySelector(".progress-line-loaded").offsetWidth
      if (pixels_value > loaded_width) {
        percent_value = Math.floor(loaded_width / active_width * 100)
      }

      this.api.currentTime = this.duration * percent_value / 100
      this.position = percent_value
      this.updateProgressPosition()
    }
  }

  updateActivePlayer() {
    const all_players = document.querySelectorAll(".player")
    const all_play_buttons = document.querySelectorAll(".player .play-pause")
    const active_players = document.querySelectorAll("#player, #player-" + this.active_id)
    const play_buttons = document.querySelectorAll("#player .play-pause, #player-" + this.active_id + " .play-pause")

    for (let i = 0; i < all_players.length; i++) {
      all_players[i].classList.remove("active")
    }

    for (let i = 0; i < all_play_buttons.length; i++) {
      all_play_buttons[i].classList.remove("active")
      all_play_buttons[i].classList.remove("pause")
    }

    for (let i = 0; i < active_players.length; i++) {
      active_players[i].classList.add("active")
    }

    for (let i = 0; i < play_buttons.length; i++) {
      if (this.is_playing) {
        play_buttons[i].classList.remove("play")
        play_buttons[i].classList.add("pause")
      } else {
        play_buttons[i].classList.remove("pause")
        play_buttons[i].classList.add("play")
      }
    }
  }

  animatePlayerTitle() {
    const overflow = this.link.innerWidth - this.title.outerWidth
    if (overflow < 0) {
      this.title.animate([{left: overflow}, {left: 42}], {
        duration: 1000,
        iterations: Infinity
      })
    }
  }

  reload() {
    window.loader.show()
    if (typeof this.api.pause !== "undefined") {
      this.api.pause()
    }

    const data = this.getData("current")
    const quality = this.is_hd ? "release" : "preview"
    const format = this.is_mp3 ? "mp3" : "ogg"

    this.title.innerHTML = data.title
    this.link.href = data.slug
    this.image.src = data.cover.thumbnail

    this.api.src = data[quality][format]
    this.api.dataset.id = this.active_id

    this.api.load()

    document.querySelectorAll(".player .position .progress-line-label span").innerHtml = '00:00:00'
    document.querySelectorAll(".player .position .progress-line-loaded").offsetWidth = 0
    document.querySelectorAll(".player .position .progress-line-active").offsetWidth = 0

    window.loader.hide()
  }

  update() {
    if (this.is_playing) {
      this.updateProgressPosition()
    }
  }

  play() {
    this.show()
    this.is_playing = true

    if (this.api.readyState === AUDIO_LOADED) {
      this.api.play()
    } else {
      this.api.load()
    }
  }

  pause() {
    this.is_playing = false

    if (this.api.readyState === AUDIO_LOADED) {
      this.api.pause()
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
  fetch("/api/posts/").then(
    response => response.json()
  ).then(data => {
      window.player = new Player(data)

      setInterval(function () {
        window.player.update()
      }, 1000)

      setInterval(function () {
        window.player.animatePlayerTitle()
      }, 14000)
  }).catch(error => {
    console.error(error)
  })
})