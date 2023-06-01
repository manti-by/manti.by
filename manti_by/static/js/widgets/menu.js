(($) => {
  'use strict'

  $.initHeaderMenu = () => {
    const menu = $('.mobile-menu')
    const button = $('.mobile-menu-button')

    button.on('click', (event) => {
      if (menu.hasClass('open')) {
        menu.removeClass('open')
        return
      }

      const offset = window.innerWidth - event.pageX - 25
      menu.css('right', offset).addClass('open')

      return false
    })

    $(document).on('click', () => {
      menu.removeClass('open')
    })

    $(document).on('keydown', (event) => {
      if (event.which === 27) {
        menu.removeClass('open')
      }
    })
  }
})(jQuery)
