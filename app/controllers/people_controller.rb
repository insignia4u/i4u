class PeopleController < InheritedResources::Base
  actions :index

  def index
    @staff = Person.by_position
    index!
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end
