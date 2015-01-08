//= require jquery
//= require jquery_ujs
//= require jquery.transit.min
//= require easing
//= require jquery-picture.min
//= require modernizer.min
//= require carousel
//= require jquery.carouFredSel-6.2.1
//= require totop
//= require jquery.parallax
//= require jquery.reject
//= require noty
//= require jquery.stellar.min
//= require behaviors/newsletter_subscriptions
//= require i4u


$(function(){
    $('[data-reply]').each(function(){
      var replyId = $(this).data('reply');
      $('[data-id="'+replyId+'"]').after($('[data-reply="'+replyId+'"]'))
    });

    $('.remove-reply').click(function(){
      $('.reply-form').fadeOut();
      $('#comment_comment_id').val(null);
    });

    $('.retry').click(function(){
      var commentId = $(this).parent().parent().data('id');
      var offsetForm = $('.post-comment-form').offset().top - 250;
      var comment = $(this).parent().parent().clone();
      $('.reply-form').show();
      $('.reply-copy').html(comment);
      $(comment).find('.retry').html('Cancel').addClass('remove-reply').removeClass('retry');
      $('#comment_comment_id').val(commentId);
      $('html, body').animate({
        scrollTop: offsetForm
      }, 1000);
      $('.remove-reply').click(function(){
        $('.reply-form').fadeOut();
        $('#comment_comment_id').val(null);
      });
    });
});