"use strict"

class Gallery {

  constructor () {
    this.image = null
    this.overlay = null
    this.id_map = []
    this.current_id = null
  }

  init () {
    const close_pointer = document.createElement('<div class="close"><i class="material-icons">close</i></div>')
    const next_pointer = document.createElement('<div class="next"><i class="material-icons">chevron_right</i></div>')
    const prev_pointer = document.createElement('<div class="prev"><i class="material-icons">chevron_left</i></div>')
    const overlay = document.createElement('<div id="overlay" class="hidden"></div>')

    // Add element to the page
    overlay.appendChild(close_pointer).appendChild(prev_pointer).appendChild(next_pointer)
    document.appendChild(overlay)

    // Bind overlay actions
    overlay.onclick = () => { this.next() }
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
    const previews = document.querySelectorAll(".preview")
    for (let i = 0; i < previews.length; i++) {
      const id = previews[i].dataset.id
      const link = previews[i].href

      previews[i].onclick = (event) => {
        event.preventDefault()
        this.build(id, link)
        this.id_map.push([id, link])
      }
    }

    this.overlay = overlay
  }

  build(id, link) {
    window.loader.show()
    this.overlay.querySelectorAll(".original").remove()

    this.image = document.createElement(
      '<img src="' + link + '" class="original resizible shadow" alt="Image #' + id + '"/>'
    )
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
    this.overlay.removeClass("hidden")
  }

  hide () {
    this.overlay.addClass("hidden")
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.gallery = new Gallery()
})
