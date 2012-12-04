class ProjectsController < InheritedResources::Base

  def list
    index!
  end

  def index
    @recent_jobs          = current_site.projects.recent_jobs
    @projects             = current_site.projects_by_created_date
    @highlighted_projects = current_site.featured_projects.map do |p|
      slider_hash(p.featured_image.url(:big), p.name, p.description)
    end
  end

  def show
    @technologies = resource.technologies.sort_by{|technology| technology.position}
    @tools        = resource.tools.sort_by{|tool| tool.position}
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end