(($) => {
  'use strict'

  let active = 0
  const slider = $('#featured-slider')
  const content = slider.find('.content')
  const controls = slider.find('.controls')

  const activateSlide = (active) => {
    const left = 0 - (active * (content.width() / 3 * 1.02))
    content.animate({ left: left + 'px' }, 800)

    controls.find('.active').removeClass('active')
    controls.find('li').eq(active).addClass('active')

    controls.find('.button').removeClass('hidden')
    active === 0 && controls.find('.prev').addClass('hidden')
    active === 2 && controls.find('.next').addClass('hidden')
  }

  const nextSlide = () => {
    if (active === 2) { return }

    active++
    activateSlide(active)
  }

  const prevSlide = () => {
    if (active === 0) { return }

    active--
    activateSlide(active)
  }

  $.initMobileSlider = () => {
    content.css('left', '0px')
    if ($(window).width() > 767) return

    slider.swipe({
      swipeLeft: () => nextSlide(),
      swipeRight: () => prevSlide()
    })

    slider.find('.controls .button').on('click', (event) => {
      const is_next = $(event.currentTarget).hasClass('next')
      is_next ? nextSlide() : prevSlide()
    })
  }
})(jQuery)
