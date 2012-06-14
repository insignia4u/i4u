require 'valid_formats'

class Project < ActiveRecord::Base
  belongs_to :site

  has_many :project_technologies
  has_many :technologies, :through => :project_technologies

  attr_accessible :site_id, :description, :ended_at, :extended_description, :name,
    :started_at, :summary, :url, :image, :featured_image

  validates :site,                 presence: true
  validates :summary,              presence: true
  validates :description,          presence: true
  validates :name,                 presence: true, uniqueness: { scope: :site_id }
  validates :url,                  presence: true, format: { with: ValidFormats::URL }

  has_attached_file :image
  has_attached_file :featured_image

  validates_attachment :image, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] },
    size: { :in => 0..2.megabytes }

  validates_attachment :featured_image,
    content_type: { content_type: ['image/jpeg', 'image/png'] },
    size: { :in => 0..2.megabytes }

  def highlight!
    update_attribute(:highlighted, true)
  end

  def unhighlight!
    update_attribute(:highlighted, false)
  end

  def highlight_state
    highlighted? ? "Yes" : "No"
  end
end
