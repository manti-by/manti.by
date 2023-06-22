"use strict"

class Gallery {

  constructor() {
    this.image = null
    this.overlay = null
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
    this.overlay.onclick = (event) => {
      event.stopPropagation()
      this.next()
    }
    next_pointer.onclick = (event) => {
      event.stopPropagation()
      this.next()
    }
    prev_pointer.onclick = (event) => {
      event.stopPropagation()
      this.prev()
    }

    close_pointer.onclick = (event) => {
      event.stopPropagation()
      this.hide()
    }

    window.onresize = () => {
      this.resize()
    }

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

    // Image box
    this.image = document.createElement("img")
    this.image.classList.add("original", "resizible", "shadow")

    // Bind image actions
    let previews = document.querySelectorAll(".preview")
    for (let i = 0; i < previews.length; i++) {
      previews[i].onclick = (event) => {
        event.preventDefault()
        this.build(previews[i])
      }
    }
  }

  build(target) {
    window.loader.show()

    this.image.src = target.href
    this.image.alt = "Image #" + target.id

    this.image.onload = () => {
      this.overlay.append(this.image)
      this.current_id = target.id

      this.open()
      this.resize()

      window.loader.hide()
    }
  }

  resize() {
    const shift_x = (window.innerWidth - this.image.offsetWidth) / 2
    const shift_y = (window.innerHeight - this.image.offsetHeight) / 2

    if (shift_x > 0) this.image.style.left = shift_x + "px"
    if (shift_y > 0) this.image.style.top = shift_y + "px"
  }

  next() {
    let target = document.getElementById(this.current_id).nextElementSibling
    if (!target) target = document.querySelector(".preview:first-child")

    this.build(target)
  }

  prev() {
    let target = document.getElementById(this.current_id).previousElementSibling
    if (!target) target = document.querySelector(".preview:last-child")
    this.build(target)
  }

  open() {
    this.overlay.classList.remove("hidden")
  }

  hide() {
    this.overlay.classList.add("hidden")
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.gallery = new Gallery()
})