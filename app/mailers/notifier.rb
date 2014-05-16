class Notifier < ActionMailer::Base

  def contact_message(message)
    @message = message

    attachments[@message.file.original_filename] = {content: message.file.read } if message.file

    mail({
      from:     message.email,
      to:      'info@insignia4u.com',
      subject: subject_for(message)
    })
  end

protected
  def subject_for(message)
    name = message.name
    message.is_to_job ? "Job Applications: #{mame}" : "Message: #{name}"
  end
end
