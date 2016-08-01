class ProjectTechnology < ActiveRecord::Base

  belongs_to :project
  belongs_to :technology

  validates :project,    presence: true
  validates :technology, presence: true
  validates :technology_id, uniqueness: { scope: :project_id }
end
