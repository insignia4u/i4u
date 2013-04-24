
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


$(window).load () ->
  initFeaturedContentSlider()
  attachNewFileButtonBehaviors()
  checkEmailOnSubscription()

  if Modernizr.svg
    $('header .logo a').html('<img src="/assets/logo-insignia.svg" width="190" height="49" alt="Insignia"/>')
  else
    $('header .logo a').html('<img src="/assets/logo-insignia.png" width="190" height="49" alt="Insignia"/>')

$(document).ready ->
  $('#cases, #intro, .carousel').carousel()

  biggestHeight = 0
  $(".equal").each ->
    biggestHeight = $(this).height()  if $(this).height() > biggestHeight

  $(".equal").height biggestHeight
