$(document).ready ->
  $('.call-to-action .trigger').on 'click', (e) ->
    e.preventDefault()
    $('body,html').animate({scrollTop: $('.contact-us').offset().top}, 500);
