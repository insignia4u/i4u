// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require plugins
//= require script
//= require jquery.carousel.min

$(document).ready(function(){
  $(function(){
    $("div.slider").carousel({
      autoSlide: true,
      autoSlideInterval: 5000
    });
  });
});
