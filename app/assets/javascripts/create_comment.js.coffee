$(document).on 'ready', ->
  form            = '#new_comment'
  article         = $(form).data('article')
  list            = $('#comment-list')
  commentTemplate = $('#comment-template').html()

  buildTemplate = (comment, name, date, id, isReply) ->

    if( isReply && isReply == true )
      _obj = $(commentTemplate)
                .find('.comment').addClass('reply').attr('data-reply', id).end()
                .find('#comment-text').html(comment).end()
                .find('#comment-author').html(name).end()
                .find('#comment-date').html(date).end()
                .find('.retry').remove().end()

    else
      _obj = $(commentTemplate)
                .find('.comment').attr('data-id', id).end()
                .find('#comment-text').html(comment).end()
                .find('#comment-author').html(name).end()
                .find('#comment-date').html(date).end()

    return _obj.html()

  retry = ->
    commentId = $(this).parent().parent().data('id')
    offsetForm = $('.post-comment-form').offset().top - 150
    comment = $(this).parent().parent().clone()

    $('.reply-form').show()
    $('.reply-copy').html comment
    $(comment).find('.retry').html('Cancel').addClass('remove-reply').removeClass 'retry'
    $('#comment_comment_id').val commentId
    $('html, body').animate scrollTop: parseInt(offsetForm)
    $('#comment_name').focus()

    $('.remove-reply').click ->
      $('.reply-form').fadeOut()
      $('#comment_comment_id').val null


  $(form).on 'submit', (event) ->
    event.preventDefault()

    $.ajax
      type:     'POST'
      url:      '/blog/articles/' + article + '/comments'
      dataType: 'json'
      data:     $(form).serialize()

      success: (response) ->
        $(form)[0].reset()
        grecaptcha.reset()

        comment = response.data.text
        name    = if response.data.name then response.data.name else 'Anonymous'
        date    = response.data.created_at
        id      = response.data.id

        if (response.data.comment_id)
          item = buildTemplate(comment, name, date, id, true)
          $('.post-comment-form .remove-reply').trigger('click')
        else
          item = buildTemplate(comment, name, date, id, false)

        list.find('.discussion ol').append('<li>' + item + '</li>')

        $('.retry').on 'click', retry

      error: (error) ->
        grecaptcha.reset()






