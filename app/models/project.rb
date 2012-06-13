require 'valid_formats'

class Project < ActiveRecord::Base
  belongs_to :site

  attr_accessible :site, :description, :ended_at, :extended_description, :name,
    :started_at, :summary, :url

  validates :summary,              presence: true
  validates :description,          presence: true
  validates :extended_description, presence: true
  validates :started_at,           presence: true
  validates :ended_at,             presence: true
  validates :name,                 presence: true, uniqueness: { scope: :site_id }
  validates :url,                  presence: true, format: { with: ValidFormats::URL }

  has_attached_file :image
  has_attached_file :featured_image

  validates_attachment :image, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }

  validates_attachment :featured_image, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }

  def highlight!
    update_attribute(:highlighted, true)
  end

  def unhighlight!
    update_attribute(:highlighted, false)
  end
end
