class PeopleController < InheritedResources::Base
  actions :index

  def index
    @main_text = load_texts(['who-we-are', 'company'])
    index!
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end
