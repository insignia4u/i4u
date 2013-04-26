class HomeController < ApplicationController

  def show
    @featured_projects = current_site.home_projects
    @technologies      = [
      {title: 'Ruby on Rails', icon_type: 'diamond'},
      {title: 'Front-end development: HTML, CSS and Javascript',icon_type: 'tech'},
      {title: 'Kohana (PHP)', icon_type: 'php', icon_text: 'php'},
      {title: 'Mobile applications development for iOS and Android platforms', icon_type: 'mobile'}
    ]
     @tools = [
      {title: 'Behaviour Driven Development', icon_type: 'cursor'},
      {title: 'Agile methodologies', icon_type: 'undo'},
      {title: 'Version control system: GIT, SVN and others', icon_type: 'site-map'},
      {title: 'Pair programming', icon_type: 'users'}
    ]
    @featured_contents = current_site.home_content.map do |content|
      slider_hash(content.image.url(:listing), content.name, content.body)
    end
  end

end
