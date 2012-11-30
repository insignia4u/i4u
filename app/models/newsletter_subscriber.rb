class NewsletterSubscriber < ActiveRecord::Base

  validates :email, presence: true, email: true, uniqueness: true

  attr_accessible :email
end
