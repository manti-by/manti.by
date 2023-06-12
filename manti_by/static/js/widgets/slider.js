"use strict"

class Slider {
  constructor() {
    this.active = 0
    this.touchstartX = 0
    this.touchendX = 0

    this.slider = document.getElementById("featured-slider")
    this.content = this.slider.querySelector(".content")
    this.controls = this.slider.querySelector(".controls")

    document.onresize = () => {
      this.bind()
    }
    this.bind()
  }

  bind() {
    this.content.style.left = 0
    if (window.innerWidth > 767) return

    this.slider.addEventListener("touchstart", (event) => {
      this.touchstartX = event.changedTouches[0].screenX
    }, {passive: true})

    this.slider.addEventListener("touchend", (event) => {
      this.touchendX = event.changedTouches[0].screenX
      this.handleSwipe()
    }, {passive: true})

    this.controls.querySelector(".button").onclick = (event) => {
      event.currentTarget.classList.contains("next") ? this.next() : this.prev()
    }
  }

  handleSwipe() {
    if (this.touchendX < this.touchstartX) this.next()
    if (this.touchendX > this.touchstartX) this.prev()
  }

  next() {
    if (this.active === 2) return

    this.active++
    this.activate()
  }

  prev() {
    if (this.active === 0) return

    this.active--
    this.activate()
  }

  activate() {
    const left = 0 - (this.active * (this.content.offsetWidth / 3 * 1.02))
    this.content.animate({left: left + 'px'}, 800)

    this.controls.querySelector(".active").classList.remove("active")
    this.controls.querySelector("li:nth-child(" + this.active + ")").classList.add("active")

    this.controls.querySelector(".button").classList.remove("hidden")
    this.active === 0 && this.controls.querySelector(".prev").classList.add("hidden")
    this.active === 2 && this.controls.querySelector(".next").classList.add("hidden")
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.slider = new Slider()
})