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
      start_date = time_rand
      end_date   = start_date + (rand(1000) + 200).years
      Project.create!(
        site:           sites.sample,
        name:           Faker::Name.name,
        summary:        "A short summary of 120 characters",
        description:    Faker::Lorem.sentences.join("\n"),
        url:            "http://www.#{Faker::Internet.domain_name}",
        image:          image,
        featured_image: featured_image,
        started_at:     start_date,
        ended_at:       end_date,
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

    def image
      @image ||= File.open(
        File.join(
          Rails.root, 'public', 'populate_images',("1".."6").to_a.sample + ".jpg"
        )
      )
    end

    def featured_image
      @featured_image ||= File.open(
        File.join(
          Rails.root, 'public', 'populate_images',("1".."6").to_a.sample + ".jpg"
        )
      )
    end

    def time_rand(from = 0.0, to = Time.now)
      Time.at(from + rand * (to.to_f - from.to_f)).to_date
    end
  end
end
