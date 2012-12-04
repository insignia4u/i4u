class Notifier < ActionMailer::Base

  def contact_message(message)
    @message = message

    attachments['uploaded'] = {content: message.file.read } if message.file

    mail({
      from:     message.email,
      to:      'contacto@insigia4u',
      subject: "Contact from website: #{message.subject}"
      })
  end

  def successfull_subscription(subscriber)
    @subscriber = subscriber
    mail(from: 'admin@insigia4u', to: subscriber, subject: "Successfull subscription")
  end
end
