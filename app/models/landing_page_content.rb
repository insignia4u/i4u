class LandingPageContent < ActiveRecord::Base
  validates :name, :title, :description, presence: true
  validates_uniqueness_of :name

  scope :by_name, -> { order(:name) }

end
