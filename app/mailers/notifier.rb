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

  def comment_notification(comment)
    @comment =  comment
    comment.email ? @email = comment.email : @email = "anonymous@insignia4u.com"

    mail({
      from:     @email,
      to:      'info@insignia4u.com',
      subject: "New comment in #{@comment.article.title}"
    })
  end

protected
  def subject_for(message)
    name = message.name
    message.is_to_job ? "Job Applications: #{name}" : "Message: #{name}"
  end
end
