$(document).ready ->
  $('#slide').on 'click', ->
    if $('.slide-down-menu-container').css('display') == 'none'
      $('.slide-down-menu-container').slideDown()
      $('#slide').animate({marginTop: '65px'})
    else
      $('.slide-down-menu-container').slideUp()
      $('#slide').animate({marginTop: '0px'})