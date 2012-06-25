class ServicesController < InheritedResources::Base
  actions :index

  protected

  def begin_of_association_chain
    @current_site
  end
end
