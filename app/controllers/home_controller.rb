class HomeController < ApplicationController
  def show
    @featured_projects = current_site.projects.featured.limit(3)
    @technologies      = Technology.limit(5)
    @tools             = Tool.limit(5)
    @featured_content  = current_site.featured_contents.limit(3)
    puts "="*50
    puts "Los featured_content cargados son: #{@featured_content.count}"
    puts "="*50
  end
end
