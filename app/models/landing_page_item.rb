class LandingPageItem < ActiveRecord::Base
  belongs_to :landing_page
  belongs_to :landing_page_content

  scope :by_position, -> { order(:position) }

end
