"use strict"

class Loader {
  constructor () {
    this.loader = document.getElementById("loader")
  }

  show () {
    this.loader.classList.add("visible")
  }

  hide () {
    this.loader.classList.remove("visible")
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.loader = new Loader()
})
