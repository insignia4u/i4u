class ServicesController < InheritedResources::Base
  actions :index

  def index
    @main_text = load_texts(['our-services', 'our-process'])
    @side_text = load_texts(['how-we-do-it', 'our-capabilities'])
    index!
  end

  protected

  def begin_of_association_chain
    @current_site
  end
end
