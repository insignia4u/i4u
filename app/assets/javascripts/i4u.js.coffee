
initFeaturedContentSlider = () ->
  $('#featured-content').css visibility:'visible'
  $('#featured-content').orbit  timer: false , fluid: '16x9', animation: 'fade'
  $('#featured').orbit timer: false, fluid: '16x9', animation: 'fade'

$(window).load () ->
  initFeaturedContentSlider()
