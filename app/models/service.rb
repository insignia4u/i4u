class Service < ActiveRecord::Base

  belongs_to :site

  attr_accessible :site_id, :summary, :title, :image

  has_attached_file :image, styles: {thumb: "281x292#", cms_thumb: "100x100#"}

  validates :site, presence: true
  validates :title, presence: true
  validates :summary, presence: true
  validates_attachment :image, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }
end
