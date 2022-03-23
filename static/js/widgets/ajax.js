"use strict"

class Ajax {
  options = {type: 'html', limit: 6}

  constructor() {
    this.footer = document.querySelector("footer")
    this.start = 6
    this.locked = false

    const params = new Proxy(new URLSearchParams(window.location.search), {
      get: (searchParams, prop) => searchParams.get(prop),
    })
    if (params.tag) this.options.tag = params.tag
  }

  bind() {
    window.onscroll = () => {
      if (this.footer.offsetTop < window.scrollTop + window.innerHeight) {
        if (!this.locked) {
          this.locked = true
          this.options.start = start

          window.loader.show()

          let query = Object.keys(this.options)
            .map(k => encodeURIComponent(k) + '=' + encodeURIComponent(this.options[k])).join('&')

          fetch("/api/?" + query).then(response => {
            if (response.status === 200) {
              this.options.start += 6
              for (const post of response.data) {
                document.querySelector(".partial .posts").append(post)
              }

              window.lazy.bind()
              window.player.updateActivePosts()

              if (response.data.length) this.locked = false
              return
            }
            console.error(response.message)
          }).finally(() => {
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
