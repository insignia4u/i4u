class FeaturedContent < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  validates :site, :name, :body, presence: true

  has_attached_file :image, styles: {
    listing:      "410x405#",
    normal:       "818x403#",
    medium:       "532x300#",
    small:        "268x151#",
    cms_thumb:    "140x138#"
  }

  validates_attachment :image, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }

  friendly_id :name, use: [:slugged, :history]
end
