class LandingPageItem < ActiveRecord::Base
  belongs_to :landing_page
  belongs_to :landing_page_content

  attr_accessible :position, :landing_page_content_id

  scope :by_position, -> { order(:position) }

end
