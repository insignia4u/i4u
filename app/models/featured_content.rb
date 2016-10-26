class FeaturedContent < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  has_attached_file :image,
       styles: {
                  listing:      "410x405#",
                  normal:       "818x403#",
                  medium:       "532x300#",
                  small:        "268x151#",
                  cms_thumb:    "140x138#"
                }

  validates :site, :name, :body, presence: true

  validates_attachment_presence :image

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  scope :ordered, -> { order("name ASC").limit(4) }

  friendly_id :name, use: [:slugged, :history]
end
