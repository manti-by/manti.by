(($) => {
  'use strict'

  $.initBlogAjax = (tag) => {
    const footer = $('footer')
    const options = { type: 'html', limit: 6 }
    let start = 6; let locked = false

    if (tag) options.tag = tag
    $(window).on('scroll', () => {
      if (footer.offset().top < $(window).scrollTop() + $(window).height()) {
        if (!locked) {
          locked = true
          options.start = start
          $.loaderShow()

          $.get('/api/posts/', options, (data) => {
            start += 6
            for (const post of data) {
              $('.blog .posts').append(post)
            }

            $.initLazyImages()
            $.player.updateActivePosts()
            if (data.length) locked = false

            $.loaderHide()
          })
        }
      }
    })
  }
})(jQuery)
