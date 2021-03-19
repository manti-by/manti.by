(($) => {
  'use strict'

  $.initLoader = () => {
    const loader = $('#loader')

    $.loaderShow = () => {
      loader.addClass('visible')
    }

    $.loaderHide = () => {
      loader.removeClass('visible')
    }
  }
})(jQuery)
