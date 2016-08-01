class ProjectTool < ActiveRecord::Base

  belongs_to :project
  belongs_to :tool

  validates :project, presence: true
  validates :tool,    presence: true
  validates :tool_id, uniqueness: { scope: :project_id }
end
