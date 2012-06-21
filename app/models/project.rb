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
    :site, :technologies, :tools

  validates :site,                 presence: true
  validates :summary,              presence: true, length: {maximum: 120}
  validates :description,          presence: true, length: {maximum: 380}
  validates :name,                 presence: true, uniqueness: { scope: :site_id }
  validates :url,                  presence: true, format: { with: ValidFormats::URL }

  has_attached_file :image, styles: {big: "267x220#", thumb: "234x230#", cms_thumb: "100x100#"}
  has_attached_file :featured_image, styles: {big: "936x553#", cms_thumb: "100x100#"}

  validates_attachment :image, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png'] }

  validates_attachment :featured_image,
    content_type: { content_type: ['image/jpeg', 'image/png'] }

  friendly_id :name, use: [:slugged, :history]

  scope :featured, where(highlighted: true)

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
