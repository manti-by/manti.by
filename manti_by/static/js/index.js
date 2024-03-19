"use strict"

const setCookie = (name, value, expire) => {
  const expire_date = new Date()

  expire_date.setDate(expire_date.getDate() + expire)
  value = encodeURIComponent(value) +
    (expire === null ? "" : "; expires=" + expire_date.toUTCString()) + "; SameSite=None;"

  document.cookie = name + "=" + value
}

const getCookie = (name, default_value) => {
  let value = document.cookie
  let start = value.indexOf(" " + name + "=");
  let end

  if (start === -1) {
    start = value.indexOf(name + "=")
  }

  if (start === -1) {
    value = default_value
  } else {
    start = value.indexOf("=", start) + 1
    end = value.indexOf(";", start)

    if (end === -1) {
      end = value.length
    }
    value = decodeURIComponent(value.substring(start, end))
  }

  return value
}

const secondsToTime = (time) => {
  let hours = Math.floor(time / 3600)
  hours = hours > 9 ? hours : "0" + hours
  time -= hours * 3600

  let minutes = Math.floor(time / 60)
  minutes = minutes > 9 ? minutes : "0" + minutes
  time -= minutes * 60

  let seconds = parseInt(time % 60, 10)
  seconds = seconds > 9 ? seconds : "0" + seconds

  return hours + ":" + minutes + ":" + seconds
}

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

class Search {
  constructor() {
    this.header = document.querySelector("header")
    this.search = document.querySelector("section")
    this.search_input = document.querySelector("section input")
    this.search_result = document.querySelector(".search-result")
    this.open_button = document.querySelector(".open-search")
    this.close_button = document.querySelector(".close-search")
    this.bind()
  }

  bind() {
    this.search_input.onkeyup = () => {
      const query = this.search_input.value

      if (query.length > 2) {
        fetch("/api/?query=" + query).then(response => {
          if (response.status === 200) {
            response.json().then(data => {
              if (data.length > 0) {
                this.search_result.classList.remove("hidden")
                this.search_result.offsetWidth = this.search_input.offsetWidth + 10
                this.search_result.style.top = this.search_input.position().top + 33
                this.search_result.style.left = this.search_input.position().left

                let search_content = ""
                for (const item of data) {
                  search_content += '<li><a href="' + item.url + '">' + item.name + '</a></li>'
                }
                this.search_result.innerHTML = "<ul>" + search_content + "</ul>"
              }
            })
            return
          }
          console.error(response)
        })
      }
    }

    this.search_input.onclick = (event) => {
      event.preventDefault()
    }

    this.open_button.onclick = (event) => {
      event.preventDefault()

      this.search.classList.add("visible")
      this.header.classList.add("hidden")

      this.search_input.focus()
    }

    const close_search = () => {
      if (!this.search.classList.contains("visible")) return

      this.search_input.value = ""

      this.search_result.classList.add("hidden")
      this.search_result.innerHTML = ""

      this.search.classList.remove("visible")
      this.header.classList.remove("hidden")
    }

    this.close_button.onclick = close_search
    document.onclick = close_search
  }
}

document.addEventListener("DOMContentLoaded", () => {
  window.header = new Header()
  window.loader = new Loader()
  window.search = new Search()
  window.lazy = new Lazy()
  window.menu = new Menu()
})
