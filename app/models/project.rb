require 'valid_formats'

class Project < ActiveRecord::Base
  extend FriendlyId

  belongs_to :site

  has_many :project_technologies
  has_many :technologies, :through => :project_technologies

  has_many :project_tools
  has_many :tools, :through => :project_tools

  attr_accessible :site_id, :description, :ended_at, :extended_description,
    :name, :started_at, :summary, :url, :image, :featured_image,
    :technology_ids, :tool_ids, :site, :technologies, :tools, :highlighted

  include Project::Validations
  include Project::Attachments
  include Project::Featuring
  include Project::Finders

  friendly_id :name, use: [:slugged, :history]
end
