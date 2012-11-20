class PeopleController < InheritedResources::Base
  actions :index

  def index
    @staff = Person.order('last_name')
    index!
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end
