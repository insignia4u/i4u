$(document).ready ->
  $('.call-to-action .trigger').on 'click', (e) ->
    e.preventDefault()
    $('body,html').animate({scrollTop: $('.trigger-end').offset().top}, 500);