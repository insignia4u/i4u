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

  has_many :project_items

  friendly_id :name, use: [:slugged, :history]
end
