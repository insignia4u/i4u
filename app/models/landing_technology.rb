class LandingTechnology < ApplicationRecord
  belongs_to :landing_page
  belongs_to :technology

  validates :landing_page,    presence: true
  validates :technology, presence: true
  validates :technology_id, uniqueness: { scope: :landing_page_id }
end
