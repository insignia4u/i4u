class HomeController < ApplicationController
  def show
    @featured_projects = current_site.home_projects
    @technologies      = [
      'Ruby on Rails',
      'Front-end development: HTML, CSS and Javascript',
      'Javascript Front-end Frameworks',
      'PHP MVC Frameworks',
      'Mobile applications development for iOS and Android platforms'
    ]

    @tools = [
      'Behaviour Driven Development',
      'Agile methodologies',
      'Version control system: GIT, SVN and others',
      'Pair programming'
    ]

    @featured_contents = current_site.home_content.map do |content|
      slider_hash(content.image.url(:listing), content.name, content.body)
    end
  end
end
