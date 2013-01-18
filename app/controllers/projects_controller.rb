class ProjectsController < InheritedResources::Base

  def list
    index!
  end

  def index
    @recent_jobs          = current_site.projects.recent_jobs
    @projects             = current_site.projects_by_created_date
    @highlighted_projects = current_site.featured_projects
  end

  def show
    @technologies = resource.technologies_by_position
    @tools        = resource.tools_by_position
  end

  protected

  def begin_of_association_chain
    current_site
  end
end