"use strict"

class Header {

  constructor() {
    let header = document.querySelector("header")
    if (header) {
      let prev_y = window.scrollTop
      let curr_y = window.scrollTop

      setInterval(() => {
        curr_y = window.scrollTop

        if (prev_y === curr_y) return

        curr_y < 60 || prev_y > curr_y
          ? header.classList.add("visible") : header.classList.remove("visible")

        prev_y = curr_y
      }, 250)
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.header = new Header()
})