$(document).ready ->
  $('.call-to-action .trigger').on 'click', (e) ->
    e.preventDefault()
    $.scrollTo($('.contact-us'), 500)
