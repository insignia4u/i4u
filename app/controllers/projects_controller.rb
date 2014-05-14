class ProjectsController < ApplicationController
  expose(:project)      { current_site.projects.find(params[:id]) }
  expose(:picks)        { current_site.featured_projects }
  expose(:projects)     { current_site.projects.recent_jobs }
  expose(:technologies) { project.technologies.by_position }
  expose(:tools)        { project.tools.by_position }

  def index; end
  def show; end
end
