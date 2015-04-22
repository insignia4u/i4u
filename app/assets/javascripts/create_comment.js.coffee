$(document).on 'ready', ->
  form            = '#new_comment'
  article         = $(form).data('article')
  list            = $('#comment-list')
  commentTemplate = $('#comment-template').html()

  buildTemplate = (data) ->

    _obj = $(commentTemplate)

    _obj.find('.comment').attr('id','comment-'+data.id).end()
        .find('#comment-text').html(data.text).end()
        .find('#comment-author').html(data.name || 'Anon').end()
        .find('#comment-date').html(data.date).end()


    if !data.comment_id
      _obj.find('.comment').attr 'data-id', data.id
    else
      _obj.find('.comment').addClass('reply').attr('data-reply', data.id).end()
          .find('.retry').remove().end()

    return _obj.html()


  $(form).on 'submit', (event) ->
    event.preventDefault()

    $('#errors-on-commments').html('')

    $.ajax
      type:     'POST'
      url:      $(form).attr 'action'
      dataType: 'json'
      data:     $(form).serialize()

      success: (response) ->
        $(form).trigger 'reset'
        grecaptcha.reset()

        item = buildTemplate(response.data)
        $('.post-comment-form .remove-reply').trigger('click')

        if !response.data.comment_id
          insert_in = list.find('.discussion ol li:last')
        else
          insert_in = list.find('.comment[data-reply="'+response.data.comment_id+'"]').last().parent()

        if !insert_in
          insert_in = list.find('.comment[data-id="'+response.data.comment_id+'"]').parent()

        insert_in.after('<li>' + item + '</li>')

        $('body,html').animate({scrollTop: $('#comment-'+response.data.id).offset().top},1000);

      error: (error) ->
        grecaptcha.reset()
        if(error.status == 422)
          data = JSON.parse(error.responseText)
          $('#errors-on-commments').html(data.errors.join('<br/>'))






