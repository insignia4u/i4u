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
      var offsetForm = $('.post-comment-form').offset().top - 150;
      var comment = $(this).parent().parent().clone();
      $('.reply-form').show();
      $('.reply-copy').html(comment);
      $(comment).find('.retry').html('Cancel').addClass('remove-reply').removeClass('retry');
      $('#comment_comment_id').val(commentId);
      $('html, body').animate({
        scrollTop: parseInt(offsetForm)
      });
      $('#comment_name').focus();
      $('.remove-reply').click(function(){
        $('.reply-form').fadeOut();
        $('#comment_comment_id').val(null);
      });
    });

    $('.comment_counter').click(function(){
      var comments = $('.discussion')[0];
      $('html, body').animate({
        scrollTop: parseInt($(comments).offset().top)
      });
    });

    $('#comment_text').limit('1400','#charsLeft');
});
