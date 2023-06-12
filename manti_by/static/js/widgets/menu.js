"use strict"

class HeaderMenu {

  constructor() {
    const menu = document.querySelector(".mobile-menu")
    const button = document.querySelector(".mobile-menu-button")

    button.onclick = (event) => {
      if (menu.classList.contains("open")) {
        menu.classList.remove("open")
        return
      }

      menu.style.right = window.innerWidth - event.pageX - 25
      menu.classList.add("open")
    }

    document.onclick = () => {
      menu.classList.remove("open")
    }

    document.onkeydown = (event) => {
      if (event.code === "Escape") {
        menu.classList.remove("open")
      }
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  new HeaderMenu()
})