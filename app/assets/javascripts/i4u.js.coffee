
$.reject({
  reject: {
    msie5: true,
    msie6: true,
    msie7: true,
    msie8: true
  },
  display: ["msie","firefox","opera","chrome","safari"],
  browserInfo: {
    msie: {
      text: 'IE10'
    },
    firefox: {
      text: 'Firefox'
    },
    opera: {
      text: 'Opera'
    },
    chrome: {
      text: 'Chrome'
    },
    safari: {
      text: 'Safari'
    }
  },
  header: '<strong><span>Did you know</span> that your Browser is out of date</strong>?',
  paragraph1: 'For the best possible experience using our website, we recommend that you upgrade Internet Explorer to the latest version for your OS. If you are using a computer at work, please contact your IT administrator.',
  paragraph2: 'If you want to you may also try some other popular Internet browsers like',
  imagePath: './assets/'
});

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
  $('.equal').height( biggestHeight + 50)

alert_div_if_errors = () ->
  if $(".field_with_errors").length > 0
    $(".field_with_errors").siblings()
    .css("color", "red").css "border-right", "red 1px solid"

$(window).load () ->
  attachNewFileButtonBehaviors()
  checkEmailOnSubscription()
  all_equals()

$(document).ready ->
  alert_div_if_errors()

  $().UItoTop easingType: "easeOutQuart"

  $('picture, figure').picture()

  $('#intro, .carousel').carousel()

  $('#position').carousel "pause"

  $('#cases').carousel('pause')

  $("#menu-btn, .tooglenav span").click ->
    $(".tooglenav .navbar").slideToggle "slow"
    $(".tooglenav span").slideToggle "slow"

  $(".nav-categories").click ->
    $(this).closest(".nav-mobile").addClass "open-categories"
    $(".categories").addClass "showcat"

    if $(".nav-mobile .btn-search").hasClass "active"
      $(".nav-mobile .js-search").removeClass "active"
      $(".nav-mobile .js-search").css("display","none")

    $(".categories").slideDown "slow", ->
      $(".categories .close").show 200
      $(".open-categories .arrow").slideDown "slow"


  $(".categories .close").click ->
    $(".categories .close").hide 200, ->
      $(".categories").slideUp "slow", ->
        $(".open-categories .arrow").slideUp "slow"
        $(".categories").removeClass "showcat"
        $(".nav-mobile").removeClass "open-categories"


  $(".nav-mobile .btn-search").click ->
    if $(".nav-mobile").hasClass "open-categories"
      $(".categories,.open-categories .arrow").css("display","none")
      $(".categories").removeClass "showcat"
      $(".nav-mobile").removeClass "open-categories"

    if $(this).hasClass "active"
      $(".nav-mobile .js-search").slideUp "fast"
      $(this).removeClass "active"
    else
      $(".nav-mobile .js-search").slideDown "fast"
      $(this).addClass "active"

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

  # ua = navigator.userAgent
  # isMobileWebkit = /WebKit/.test(ua) and /Mobile/.test(ua)
  # $("html").addClass "mobile"  if isMobileWebkit
  # $ ->
  #   iScrollInstance = undefined
  #   if isMobileWebkit
  #     iScrollInstance = new iScroll("wrapper")
  #     $("#scroller").stellar
  #       scrollProperty: "transform"
  #       horizontalScrolling: false
  #       verticalOffset: 150

  #   else
  #     $.stellar
  #       horizontalScrolling: false
  #       verticalOffset: 150



  $('#scene').parallax()

  # $('.vanilla-parallax, #intro-parallax').parallax()

  # heightScreen = $(window).height() - 137
  # $("#intro-parallax").height(heightScreen)


  $(".dash-box a").click (e) ->
    e.preventDefault()
    box=$(this).parent()
    id= box.data 'box'


    $(".slider").css "height", "auto"

    $(".slider-valor").removeClass("active")

    $('#box_'+id).addClass("active")

    heightSlider = $('box_'+id).height()
    $(".slider").height heightSlider

  $(".slider .close").click ->
    $(".slider").css "height", "auto"

    $(".slider .single").removeClass("active")
    $(".slider-valor").addClass("active")

    heightSlider = $(".slider-valor").height()
    $(".slider").height heightSlider


  $(".position-info .btn-primary").click (e) ->
    e.preventDefault()

    box=$(this).parent().parent()
    id= box.data 'box'

    $(".careers-position").css "height", "auto"

    $(".slider-position").removeClass("active")

    $('#boxp_'+id).addClass("active")

    heightSlider2 = $(".careers-position .single").height()
    $(".careers-position").height heightSlider2

  $(".careers-position .close").click ->
    $(".careers-position").css "height", "auto"

    $(".careers-position .single").removeClass("active")
    $(".slider-position").addClass("active")

    heightSlider = $(".slider-valor").height()
    $(".slider").height heightSlider


  if($('#slider-valor').length)
    $("#slider-valor ul").carouFredSel
      prev: '#prev-valor',
      next: '#next-valor',
      width: '100%',
      pagination: "#pager-valor",
      auto:
        play: false,

      swipe:
        onTouch: true
        onMouse: true
    ,
      # transition: true

  $("#l-testimonials").click (e) ->
    e.preventDefault()
    $("html, body").animate
      scrollTop: $(".cover3").offset().top
    , 1200

  $("#l-contacts").click (e) ->
    e.preventDefault()
    $("html, body").animate
      scrollTop: $(".contact_form").offset().top
    , 1200

  $('.contact_form #file_field_text').on 'click', (e) ->
    e.preventDefault()
    $('.contact_form .hidden_field').click()

  $('.contact_form .hidden_field').on 'change', (e) ->
    $('.contact_form #file_field_text').val($(this).val())

