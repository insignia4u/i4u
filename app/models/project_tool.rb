class ProjectTool < ActiveRecord::Base
  belongs_to :project
  belongs_to :tool

  attr_accessible :project_id, :tool_id

  validates :project, presence: true
  validates :tool,    presence: true
  validates :tool_id, uniqueness: { scope: :project_id }
end
