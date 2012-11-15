class HomeController < ApplicationController
  def show
    @featured_projects = current_site.projects.featured.limit(3)
    @technologies      = Technology.limit(5)
    @tools             = Tool.limit(5)
  end
end
