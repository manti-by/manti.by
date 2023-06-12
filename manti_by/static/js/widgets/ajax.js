"use strict"

class Ajax {
  constructor() {
    this.locked = false
    this.options = {start: 6,  limit: 6}
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

          fetch("/api/html/?" + query).then(data => {
            let posts = document.querySelector(".posts")
            posts.innerHTML += data
            this.options.start += 6
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
  window.ajax = new Ajax()
})