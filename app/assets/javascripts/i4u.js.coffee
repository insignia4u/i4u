
# On Windows Load ->

deleteFileToUploadClicked = () ->
  $('#attachment-files li').remove()
  $('#attach-file').replaceWith($('#attach-file').clone(true))
  $('#attach-new-file').show()

fileToUploadChanged = (pathFile) ->
  if !pathFile or pathFile.length is 0
    deleteFileToUploadClicked()
  else
    $('#attachment-files').append(
      '<li><img src="assets/other/clip.png"/><p><b>' +
      pathFile.split(/\\|\//).slice(-1) +
      '</b><a class="more" id="deleteFileToDelete" href="#">Delete file</a></p>'
    )

    $('#deleteFileToDelete').click deleteFileToUploadClicked
    $('#attach-new-file').hide()

attachNewFileButtonBehaviors = () ->
  $('#attach-new-file').click () ->
    $('#attach-file').trigger('click')

  $('#attach-file').change () ->
    fileToUploadChanged $(this).val()

initFeaturedContentSlider = () ->
  $('#featured-content').css visibility:'visible'
  $('#featured-content').orbit  timer: false , fluid: '16x9', animation: 'fade'
  $('#featured').orbit timer: false, fluid: '16x9', animation: 'fade'

checkEmailOnSubscription = () ->
  $('.footer-subscribe :submit').click () ->
    $('#message').empty()
    if $('#newsletter_subscriber_email').val() is ''
      $('#message').html("<ul><li>" + 'The email is required!' + "</li></ul>")
        .removeClass()
        .addClass('failed-subscription')
      return false

    return true

# On Ready ->

all_equals = () ->
  numbers = ['',"2","3","4"]
  i = 0
  while i < numbers.length
    biggestHeight = 0

    $('.equal' + numbers[i]).each ->
      biggestHeight = $(this).height()  if $(this).height() > biggestHeight

    $(".equal" + numbers[i]).height biggestHeight
    i++

check_modernizer = () ->
  if Modernizr.svg
    $("header h1 a").html "<img src=\"/assets/insignia.svg\" alt=\"Insignia\"/>"
  else
    $("header h1 a").html "<img src=\"/assets/insignia.jpg\" alt=\"Insignia\"/>"

check_client_width = () ->
  if document.documentElement.clientWidth < 767
    $("#logo").insertAfter "nav"
  else
    $("nav").insertAfter "#logo"
  $(window).resize ->
    if document.documentElement.clientWidth < 767
      $("#logo").insertAfter "nav"
    else
      $("nav").insertAfter "#logo"

$(window).load () ->
  initFeaturedContentSlider()
  attachNewFileButtonBehaviors()
  checkEmailOnSubscription()

  if Modernizr.svg
    $('header .logo a').html('<img src="/assets/logo-insignia.svg" width="190" height="49" alt="Insignia"/>')
  else
    $('header .logo a').html('<img src="/assets/logo-insignia.png" width="190" height="49" alt="Insignia"/>')

$(document).ready ->
  all_equals()
  check_modernizer()
  check_client_width()

  $().UItoTop easingType: "easeOutQuart"

  $('picture, figure').picture()

  $('#cases, #intro, .carousel').carousel()

  $("#menu-btn, header nav span").click ->
    $("header nav ul").slideToggle "slow"
    $("header nav span").slideToggle "slow"

  $(".nav-categories").click ->
    $(".nav-blog-categories").slideDown "slow", ->
      $(".nav-blog-categories .close").show 200


  $(".nav-blog-categories .close").click ->
    $(".nav-blog-categories .close").hide 200, ->
      $(".nav-blog-categories").slideUp "slow"


  $(".nav-blog .btn-search").click ->
    $(".nav-blog form").fadeIn 200

  $("input, textarea").on "focus blur", ->
    $(this).next().toggleClass "focus"
