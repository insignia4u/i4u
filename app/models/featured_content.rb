class FeaturedContent < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  has_attached_file :image,
       styles: {
                  listing:      "410x405#",
                  normal:       "818x403#",
                  medium:       "650x320#",
                  small:        "268x151#",
                  cms_thumb:    "140x138#"
                }

  validates :site, :name, :body, presence: true

  validates_attachment_presence :image

  friendly_id :name, use: [:slugged, :history]
end
