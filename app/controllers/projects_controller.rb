class ProjectsController < ApplicationController
  layout "landing", only: [:show]
  expose(:project)      { current_site.projects.friendly.find(params[:id]) }
  expose(:picks)        { current_site.featured_projects }
  expose(:projects)     { current_site.projects.recent_jobs }
  expose(:technologies) { project.technologies.by_position }
  expose(:tools)        { project.tools.by_position }
  expose(:project_items) { project.project_items }
  expose(:message) { Message.new }

  def index; end
  def show; end
end
