require "static_content/technologies"
require "static_content/tools"

class HomeController < ApplicationController
  expose(:projects)    { current_site.home_projects }
  expose(:slider)      { slider_content }
  expose(:recent_news) { current_site.articles.most_recents }

  def show; end

protected
  def slider_content
    SlideBuilder.new(current_site.home_content).slideshow
  end
end
