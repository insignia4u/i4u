class LandingPageItem < ActiveRecord::Base
  belongs_to :landing_page
  attr_accessible :title, :description, :position

  validates :title, :description, presence: true
end
