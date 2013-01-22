class Notifier < ActionMailer::Base

  def contact_message(message)
    @message = message

    attachments['uploaded'] = {content: message.file.read } if message.file

    mail({
      from:     message.email,
      to:      'contacto@insignia4u.com',
      subject: "Contact from website: #{message.subject}"
      })
  end

  def successfull_subscription(subscriber)
    @subscriber = subscriber
    mail(from: 'admin@insignia4u.com', to: subscriber, subject: "Welcome to the Insignia Newsletter")
  end
end
