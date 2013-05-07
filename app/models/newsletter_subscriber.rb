class NewsletterSubscriber < ActiveRecord::Base

  validates :email, presence: true, :email => true
  validates :email, uniqueness: { message: "You're already subscribed." }

  after_create :add_to_mail_chimp_list_callback

  def retry_mail_chimp_subscription
    add_mail_to_mail_chimp_list(email)
  end

  def add_to_mail_chimp_list_callback
    add_mail_to_mail_chimp_list(self.email)
  end

  def add_mail_to_mail_chimp_list(email)
    result = Gibbon.new.list_subscribe(id: MAIL_CHIMP[:list_id], email_address: email)

    if result == true
      update_attribute(:on_mail_chimp_list, true)

      Rails.logger.info "The #{email} was succesfull added to \"#{MAIL_CHIMP[:list_name]}\" mail chimp list..."
    else
      Rails.logger.info "Mail chimp #error"
      Rails.logger.info result["error"]
    end

    result
  end
end
