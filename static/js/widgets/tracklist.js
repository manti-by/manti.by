"use strict"

class Tracklist {
  constructor() {
    document.querySelectorAll(".show-tracklist").onclick = (event) => {
      event.target.closest(".data").querySelector(".info").classList.add("hidden")
      event.target.closest(".data").querySelector(".tracklist").classList.remove("hidden")
    }

    document.querySelectorAll(".hide").onclick = (event) => {
      event.target.closest(".data").querySelector(".info").classList.remove("hidden")
      event.target.closest(".data").querySelector(".tracklist").classList.add("hidden")
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  new Tracklist()
})