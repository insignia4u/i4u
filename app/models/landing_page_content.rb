class LandingPageContent < ActiveRecord::Base
  attr_accessible :name, :title, :description

  validates :name, :title, :description, presence: true
  validates_uniqueness_of :name

end
