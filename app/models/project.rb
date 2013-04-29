require 'valid_formats'

class Project < ActiveRecord::Base
  extend FriendlyId
  include Project::Validations
  include Project::Attachments
  include Project::Featuring
  include Project::Finders

  belongs_to :site

  has_many :project_technologies
  has_many :technologies, :through => :project_technologies

  has_many :project_tools
  has_many :tools, :through => :project_tools

  has_many :project_images

  attr_accessible :site_id, :description, :ended_at, :extended_description,
    :name, :started_at, :summary, :url, :image, :featured_image,
    :technology_ids, :tool_ids, :site, :technologies, :tools, :highlighted

  friendly_id :name, use: [:slugged, :history]
end
