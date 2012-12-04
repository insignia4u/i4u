require 'valid_formats'

class Project < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  has_many :project_technologies
  has_many :technologies, :through => :project_technologies

  has_many :project_tools
  has_many :tools, :through => :project_tools

  attr_accessible :site_id, :description, :ended_at, :extended_description, :name,
    :started_at, :summary, :url, :image, :featured_image, :technology_ids, :tool_ids,
    :site, :technologies, :tools, :highlighted

  validates :site,                 presence: true
  validates :summary,              presence: true, length: {maximum: 120}
  validates :description,          presence: true
  validates :name,                 presence: true, uniqueness: { scope: :site_id }
  validates :url,                  presence: true, format: { with: ValidFormats::URL }
  validates :featured_image, :attachment_presence => true, :if => :highlighted

  validate  :validate_started_at_date_before_today
  validate  :validate_ended_at_date_after_started_at

  has_attached_file :image,
    styles: { big: "277x250#", thumb: "234x230#", cms_thumb: "100x100#" }
  has_attached_file :featured_image,
    styles: { big: "940x555#", cms_thumb: "100x100#" }


  validates_attachment :image, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }
  validates_attachment :featured_image,
    content_type: { content_type: ['image/jpeg', 'image/png'] }


  friendly_id :name, use: [:slugged, :history]

  scope :featured,         where(highlighted: true)
  scope :by_created_date, order("created_at DESC")

  def highlight!
    update_attributes(highlighted: true)
  end

  def unhighlight!
    update_attributes(highlighted: false)
  end

  def highlight_state
    highlighted? ? "Yes" : "No"
  end

  def self.recent_jobs(n=3)
    Project.order("created_at DESC").limit(n)
  end

  def validate_started_at_date_before_today
    if started_at
      errors.add(:started_at, "Invalid date!") if started_at >= (DateTime.now - 1)
    end
  end

  def validate_ended_at_date_after_started_at
    if ended_at
      errors.add(:ended_at, "Invalid date!") if started_at >= ended_at
    end
  end

end
