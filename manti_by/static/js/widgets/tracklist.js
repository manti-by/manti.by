(($) => {
  'use strict'

  $.initTracklist = () => {
    $(document).on('click', '.show-tracklist', (event) => {
      $(event.target).closest('.data')
        .find('.info').addClass('hidden')

      $(event.target).closest('.data')
        .find('.tracklist').removeClass('hidden')
    })

    $(document).on('click', '.hide-tracklist', (event) => {
      $(event.target).closest('.data')
        .find('.info').removeClass('hidden')

      $(event.target).closest('.data')
        .find('.tracklist').addClass('hidden')
    })
  }
})(jQuery)
