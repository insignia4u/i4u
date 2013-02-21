module Populator
  class Projects
    def initialize
      Project.delete_all
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
        image:          image,
        featured_image: featured_image,
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
          Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"
        )
      )
    end

    def featured_image
      @featured_image ||= File.open(
        File.join(
          Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"
        )
      )
    end
  end
end
