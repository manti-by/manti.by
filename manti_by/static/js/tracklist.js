"use strict"

class Tracklist {
  constructor() {
    let show_buttons = document.querySelectorAll(".show-tracklist"),
        hide_buttons = document.querySelectorAll(".hide-tracklist")

    for (let i = 0; i < show_buttons.length; i++) {
      show_buttons[i].onclick = (event) => {
        event.target.closest(".data").querySelector(".info").classList.add("hidden")
        event.target.closest(".data").querySelector(".tracklist").classList.remove("hidden")
      }
    }

    for (let i = 0; i < hide_buttons.length; i++) {
      hide_buttons[i].onclick = (event) => {
        event.target.closest(".data").querySelector(".info").classList.remove("hidden")
        event.target.closest(".data").querySelector(".tracklist").classList.add("hidden")
      }
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.tracklist = new Tracklist()
})