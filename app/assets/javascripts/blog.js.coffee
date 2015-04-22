$(document).on 'ready', ->
  $('#comment_text').limit('1400','#charsLeft');


$(document).on 'click','.remove-reply', ->
  $('.reply-form').fadeOut();
  $('#comment_comment_id').val(null);

$(document).on 'click' ,'.retry', ->
  commentId  = $(this).parent().parent().data('id')
  offsetForm = $('.post-comment-form').offset().top - 150
  comment    = $(this).parent().parent().clone()

  $('.reply-form').show();

  $('.reply-copy').html comment

  $(comment).find('.retry').html('Cancel').addClass('remove-reply').removeClass('retry');

  $('#comment_comment_id').val commentId

  $('html, body').animate({
    scrollTop: parseInt(offsetForm)
  });

  $('#comment_name').focus();

$(document).on 'click', '.comment_counter', ->
  comments = $('.discussion')[0];
  $('html, body').animate({
    scrollTop: parseInt($(comments).offset().top)
  });
