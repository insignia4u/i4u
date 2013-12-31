
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
  biggestHeight = 0
  $('.equal').each ->
    biggestHeight = $(this).height() if $(this).height() > biggestHeight
  $('.equal').height( biggestHeight )

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

alert_div_if_errors = () ->
  if $(".field_with_errors").length > 0
    $(".field_with_errors").siblings()
    .css("color", "red").css "border-right", "red 1px solid"

$(window).load () ->
  attachNewFileButtonBehaviors()
  checkEmailOnSubscription()
  all_equals()

$(document).ready ->
  check_modernizer()
  check_client_width()
  alert_div_if_errors()

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

  errors = $('.field_with_errors')

  if errors.length > 0
    nt = noty
      text: 'Please fill mandatory fields.'
      type: "error"
      dismissQueue: true
      layout: 'top'
      theme: "defaultTheme"

  success = $('#notice_div')

  if success.length == 1
    nt = noty
      text: "Your message was successfully sent."
      type: "success"
      dismissQueue: true
      layout: 'top'
      theme: "defaultTheme"

  biggestHeight = 0

  $(".equal5").each ->
    biggestHeight = $(this).height() if $(this).height() > biggestHeight

  $(".equal5").css('height', biggestHeight + 50)

  $('#vanilla-parallax, #intro-parallax, .careers-title').parallax()

  heightScreen = $(window).height() - 137
  $("#intro-parallax").height(heightScreen)

  $(".dash-box a").click (e) ->
    e.preventDefault()
    if $(".slider .single").hasClass("active")
      $(".slider .single").removeClass("active")
      $(".slider-valor").addClass("active")
    else
      $(".slider .single").addClass("active")
      $(".slider-valor").removeClass("active")

  $(".single .close").click ->
    $(".slider .single").removeClass("active")
    $(".slider-valor").addClass("active")


  $("#slider-valor ul").carouFredSel
    prev: '#prev-valor',
    next: '#next-valor',
    width: '100%',
    pagination: "#pager-valor",
    swipe:
      onTouch: true
      onMouse: true
