"use strict"

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
  new Search()
})
