class HomeController < ApplicationController
  def show
    @featured_projects = current_site.projects.featured.limit(3)
    @technologies      = Technology.limit(5)
    @tools             = Tool.limit(5)
    @featured_content  = current_site.featured_contents.limit(3)
  end
end
