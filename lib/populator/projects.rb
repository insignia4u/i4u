require "populator/images"

module Populator
  class Projects
    def initialize
      Project.delete_all

      @images = Populator::Images.new
    end

    def create!(q=1)
      q.times do
        project = create_project

        project.technologies << [technologies.sample]
        project.tools        << [tools.sample]
      end
    end

  protected

    def create_project
      Project.create!(
        site:           sites.sample,
        name:           Faker::Name.name,
        summary:        "A short summary of 120 characters",
        description:    Faker::Lorem.sentences.join("\n"),
        url:            "http://www.#{Faker::Internet.domain_name}",
        image:          @images.sample,
        featured_image: @images.sample,
        highlighted: [true, false].sample
      )
    end

    def sites
      Site.all
    end

    def technologies
      Technology.all
    end

    def tools
      Tool.all
    end
  end
end
