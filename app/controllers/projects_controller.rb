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

  def caso
    render :show
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end