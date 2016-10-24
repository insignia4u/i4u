$(document).ready ->
  $('.call-to-action .trigger').on 'click', (e) ->
    e.preventDefault()
    $('body,html').animate({scrollTop: $('.payment-info').offset().top}, 500);