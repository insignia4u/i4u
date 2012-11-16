class FeaturedContent < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  attr_accessible :name, :body, :image, :site

  validates :site, :name, :body, presence: true

  validates_attachment_presence :image

  has_attached_file :image,
    styles: { listing: "410x405#", cms_thumb: "100x100#" }
end
