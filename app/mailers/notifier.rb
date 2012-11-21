class Notifier < ActionMailer::Base
  default to: "contacto@insignia4u.com"

  def contact_message(message)
    @message = message

    if message.file
      attachments['uploaded'] = {content: message.file.read }
    end

    mail(from: message.email, subject: "Contact from website: #{message.subject}")
  end
end