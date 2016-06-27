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
    @email = comment.email.present? ?  comment.email : "anonymous@noemail.com"

    mail({
      from:     @email,
      to:      'info@insignia4u.com',
      subject: "New comment in #{@comment.article.title}"
    })
  end

  def notify_to_comments_author(comment, email)
    @comment       = comment
    @answer        = @comment.text
    @article_title = @comment.article.title

    mail({
      from:     "info@insignia4u.com",
      to:       email,
      subject:  "Someone answered your comment in #{@article_title}"
    })
  end

  def reservation_msg(reservation)
    @reservation = reservation

    mail({
      from:     reservation.email,
      to:      'info@insignia4u.com',
      subject: "Reservacion al curso #{@reservation.training}",
      reply_to: reservation.email
    })
  end

  def reservation_author_msg(reservation)
    @reservation = reservation

    mail({
      from:     'Insignia Training <training@insignia4u.com>',
      to:      reservation.email,
      subject: "Reservacion al curso #{@reservation.training}"
    })
  end

protected
  def subject_for(message)
    name = message.name
    message.is_to_job ? "Job Applications: #{name}" : "Message: #{name}"
  end
end
