"use strict"

class Ajax {
  constructor() {
    this.locked = false
    this.options = {format: "html", start: 6,  limit: 6}
    this.footer = document.querySelector("footer")

    const params = new Proxy(new URLSearchParams(window.location.search), {
      get: (searchParams, prop) => searchParams.get(prop),
    })
    if (params.tag) this.options.tag = params.tag

    this.bind()
  }

  bind() {
    window.onscroll = () => {
      if (this.footer.offsetTop < window.scrollY + window.innerHeight) {
        if (!this.locked) {
          this.locked = true
          window.loader.show()

          let query = Object.keys(this.options)
            .map(k => encodeURIComponent(k) + '=' + encodeURIComponent(this.options[k])).join('&')

          fetch("/api/?" + query).then(response => {
            if (response.status === 200) {
              return response.text()
            }
            console.error(response.message)
          }).then(data => {
            this.options.start += 6
            document.querySelector(".partial .posts").append(data)
            window.lazy.bind()
            window.player.updateActivePosts()
          }).finally(() => {
            this.locked = false
            window.loader.hide()
          })
        }
      }
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  new Ajax()
})
