"use strict"

class Lazy {

  constructor() {
    this.observer = new IntersectionObserver(changes => {
      for (const change of changes) {
        if (!change.target.dataset.src) return

        change.target.src = change.target.dataset.src
        change.target.onload = () => {
          change.target.classList.remove("lazy")
          delete change.target.dataset.src
        }
      }
    })
    this.bind()
  }

  bind() {
    const images = document.querySelectorAll(".lazy")
    for (let i = 0; i < images.length; i++) {
      this.observer.observe(images[i])
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.lazy = new Lazy()
})