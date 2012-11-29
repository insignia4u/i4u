class HomeController < ApplicationController
  def show
    @featured_projects = current_site.home_projects
    @technologies      = Technology.by_position.limit(5)
    @tools             = Tool.by_position.limit(5)
    
    @featured_contents = current_site.home_content.map do |content|
      slider_hash(content.image.url(:listing), content.name, content.body)
    end
  end
end
