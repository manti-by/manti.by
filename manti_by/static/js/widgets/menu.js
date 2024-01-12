"use strict"

class Menu {

  constructor() {
    const button = document.getElementById("mobile-menu-button")
    const menu = document.getElementById("mobile-menu")

    if (button) {
      button.onclick = (event) => {
        event.preventDefault()

        menu.classList.toggle("open")
        menu.style.right = window.innerWidth - event.pageX - 25 + "px"
      }
    }

    document.onkeydown = (event) => {
      if (event.code === "Escape") {
        menu.classList.remove("open")
      }
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.menu = new Menu()
})