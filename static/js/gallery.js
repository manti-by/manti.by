"use strict"

class Gallery {

  constructor () {
    this.image = null
    this.overlay = null
    this.id_map = []
    this.current_id = null

    this.init()
  }

  init() {
    // Create image overlay
    this.overlay = document.createElement("div")
    this.overlay.classList.add("hidden")
    this.overlay.id = "overlay"

    // Create controls
    let close_icon = document.createElement("i")
    close_icon.classList.add("material-icons")
    close_icon.innerText = "close"

    let close_pointer = document.createElement("div")
    close_pointer.classList.add("close")
    close_pointer.appendChild(close_icon)

    let next_icon = document.createElement("i")
    next_icon.classList.add("material-icons")
    next_icon.innerText = "chevron_right"

    let next_pointer = document.createElement("div")
    next_pointer.classList.add("next")
    next_pointer.appendChild(next_icon)

    let prev_icon = document.createElement("i")
    prev_icon.classList.add("material-icons")
    prev_icon.innerText = "chevron_left"

    let prev_pointer = document.createElement("div")
    prev_pointer.classList.add("prev")
    prev_pointer.appendChild(prev_icon)

    // Add controls to overlay and overlay to document
    this.overlay.appendChild(close_pointer)
    this.overlay.appendChild(next_pointer)
    this.overlay.appendChild(prev_pointer)
    document.body.appendChild(this.overlay)

    // Bind overlay actions
    this.overlay.onclick = () => { this.next() }
    next_pointer.onclick = () => { this.next() }
    prev_pointer.onclick = () => { this.prev() }

    close_pointer.onclick = (event) => {
      event.stopPropagation()
      this.hide()
    }

    window.onresize = () => { this.resize() }

    document.onkeydown = (event) => {
      if (event.code === "Escape") {
        this.hide()
      }
      if (event.code === "ArrowRight") {
        this.next()
      }
      if (event.code === "ArrowLeft") {
        this.prev()
      }
    }

    // Bind image actions
    let previews = document.querySelectorAll(".preview")
    for (let i = 0; i < previews.length; i++) {
      const id = previews[i].dataset.id
      const link = previews[i].href

      previews[i].onclick = (event) => {
        event.preventDefault()
        this.build(id, link)
      }
      this.id_map.push([id, link])
    }
  }

  build(id, link) {
    window.loader.show()

    let original = this.overlay.querySelector(".original")
    if (original) original.remove()

    this.image = document.createElement("img")
    this.image.classList.add("original", "resizible", "shadow")
    this.image.src = link
    this.image.alt = "Image #" + id

    this.image.onload = () => {
      this.current_id = id
      this.overlay.append(this.image)

      this.open()
      this.resize()

      window.loader.hide()
    }
  }

  resize () {
    const shift_x = (window.innerWidth - this.image.offsetWidth) / 2
    const shift_y = (window.innerHeight  - this.image.offsetHeight) / 2

    if (shift_x > 0) this.image.style.left = shift_x
    if (shift_y > 0) this.image.style.top = shift_y
  }

  next () {
    for (let i = 0; i < this.id_map.length; i++) {
      if (this.current_id === this.id_map[i][0]) {
        if (i + 1 === this.id_map.length) {
          this.build(this.id_map[0][0], this.id_map[0][1])
        } else {
          this.build(this.id_map[i + 1][0], this.id_map[i + 1][1])
        }
        return
      }
    }
  }

  prev () {
    for (let i = 0; i < this.id_map.length; i++) {
      if (this.current_id === this.id_map[i][0]) {
        if (i - 1 < 0) {
          this.build(this.id_map[this.id_map.length][0], this.id_map[this.id_map.length][1])
        } else {
          this.build(this.id_map[i - 1][0], this.id_map[i - 1][1])
        }
        return
      }
    }
  }

  open () {
    this.overlay.classList.remove("hidden")
  }

  hide () {
    this.overlay.classList.add("hidden")
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.gallery = new Gallery()
})
