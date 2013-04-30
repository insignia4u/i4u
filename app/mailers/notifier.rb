class Notifier < ActionMailer::Base

  def contact_message(message)
    @message = message

    attachments[@message.file.original_filename] = {content: message.file.read } if message.file

    mail({
      from:     message.email,
      to:      'contacto@insignia4u.com',
      subject: "Contact from: #{message.subject}"
      })
  end
end
