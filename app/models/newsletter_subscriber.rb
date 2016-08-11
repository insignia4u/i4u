class NewsletterSubscriber < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email: true

  after_create :push_to_mailchimp

protected
  def push_to_mailchimp
    return true  if Rails.env.development?
    return false unless gibbon_subscriber

    update_attribute(:on_mail_chimp_list, true)
    return true
  end

  def gibbon_subscriber
    Gibbon::Request.new.lists(MAIL_CHIMP[:list_id]).members.create(body: {email_address: email, status: "subscribed"})
  end
end
