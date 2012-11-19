class ProjectsController < InheritedResources::Base

  def list
    index!
  end

  def index
    @highlighted_projects  = Project.featured
    @recent_jobs           = Project.recent_jobs
  end

  def caso
    render :show
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end