class NewsletterSubscriber < ActiveRecord::Base

  validates :email, presence: true, email: true 
  validates :email, uniqueness: { message: "The email entered already is subscribed." }

  attr_accessible :email
end
