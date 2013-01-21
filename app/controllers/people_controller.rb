class PeopleController < InheritedResources::Base
  actions :index

  protected
    def begin_of_association_chain
      current_site
    end

    def collection
      @people ||= end_of_association_chain.by_position
    end
end
