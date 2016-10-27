$(document).ready ->
  $('#slide').on 'click', ->
    if $('.blog-header').css('display') == 'none'
      $('.blog-header').slideDown()
    else
      $('.blog-header').slideUp()