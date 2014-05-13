class PeopleController < ApplicationController
  expose(:team) { current_site.people.by_position }

  def index; end
end
