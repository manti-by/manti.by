(($) => {
  'use strict'

  $(document).ready(() => {
    // Init global widgets
    $.initLoader()
    $.initLazyImages()

    $.initHeaderMenu()
    $.initHeader()
    $.initSearch()

    // Init player
    $.get('/api/posts/', (data) => {
      $.player.init(data)

      setInterval(function () {
        $.player.update()
      }, 1000)

      setInterval(function () {
        $.player.animatePlayerTitle()
      }, 14000)
    }).fail(function() {
      console.error("Error loading player data")
    })
  })
})(jQuery)
