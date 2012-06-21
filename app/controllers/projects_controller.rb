class ProjectsController < InheritedResources::Base

  def list
    index!
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end
