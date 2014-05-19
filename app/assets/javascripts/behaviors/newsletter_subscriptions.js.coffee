input = $('#newsletter_subscriber_email')
form  = $('#newsletter > form')

successful_request = () ->
  alert("Thanks for subscribing to our Newsletter!")
  input.val("")

failed_request = () ->
  alert("Please, check the email you're trying to subscribe and try again.")
  input.focus()

ajax_subscription = () ->
  form.on 'submit', (event) ->
    event.preventDefault()

    posting = $.post('/subscribe', form.serialize())
    posting.done () -> successful_request()
    posting.fail () -> failed_request()

$(document).ready -> ajax_subscription()
