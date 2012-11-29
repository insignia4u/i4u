class ProjectsController < InheritedResources::Base

  def list
    index!
  end

  def index
    @recent_jobs          = Project.recent_jobs
    @projects             = Project.order("created_at DESC")
    @highlighted_projects = Project.featured.map do |p|
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