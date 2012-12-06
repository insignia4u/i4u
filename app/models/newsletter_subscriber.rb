class NewsletterSubscriber < ActiveRecord::Base

  validates :email, presence: true, email: true 
  validates :email, uniqueness: { message: "You're already subscribed." }

  attr_accessible :email
end
