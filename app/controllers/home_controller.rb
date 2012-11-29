class HomeController < ApplicationController
  def show
    @featured_projects = current_site.projects.featured.limit(3)
    @technologies      = Technology.by_position.limit(5)
    @tools             = Tool.by_position.limit(5)
    @featured_contents = current_site.featured_contents.limit(3).map do |content|
      slider_hash(content.image.url(:listing), content.name, content.body)
    end
  end
end
