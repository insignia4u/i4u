class FeaturedContent < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  attr_accessible :name, :body, :image, :site, :site_id

  validates :site, :name, :body, presence: true

  validates_attachment_presence :image

  has_attached_file :image,
    styles: { listing: "410x405#", cms_thumb: "140x138#" }

  friendly_id :name, use: [:slugged, :history]
end
