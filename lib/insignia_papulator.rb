require "faker"

module Insignia
  class Populator
    def self.person
      Person.delete_all

      sites  = Site.all
      titles = Title.all

      @q.times do
        photo = File.open(File.join(Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"))

        Person.create!(
          site:       sites.sample,
          title:      titles.sample,
          first_name: Faker::Name.first_name,
          last_name:  Faker::Name.last_name,
          bio:        Faker::Lorem.sentence(10),
          photo:      photo
        )
      end
    end

    def self.technology
      Technology.delete_all

      @q.times do
        Technology.create( name: Faker::Name.name )
      end
    end

    def self.tool
      Tool.delete_all

      @q.times do
        Tool.create( name: Faker::Name.name )
      end
    end

    def self.project
      Project.delete_all

      sites        = Site.all
      technologies = Technology.all
      tools        = Tool.all

      @q.times do
        image_1 = File.open(File.join(Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"))
        image_2 = File.open(File.join(Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"))

        project = Project.create!(
          site:           sites.sample,
          name:           Faker::Name.name,
          summary:        "A short summary of 120 characters",
          description:    Faker::Lorem.sentences.join("\n"),
          url:            "http://www.#{Faker::Internet.domain_name}",
          image:          image_1,
          featured_image: image_2,
          highlighted: [true, false].sample
        )

        project.technologies << [technologies.sample]
        project.tools        << [tools.sample]

        image_1.close
        image_2.close
      end
    end

    def self.featured_content
      FeaturedContent.delete_all

      sites        = Site.all

      @q.times do
        image_1 = File.open(File.join(Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"))

        featured_content  = FeaturedContent.create!(
          site:           sites.sample,
          name:           Faker::Name.name,
          body:    Faker::Lorem.sentences.join("\n"),
          image:          image_1
        )
        image_1.close
      end
    end

    class << self
      alias_method :people,       :person
      alias_method :technologies, :technology
      alias_method :tools,        :tool
      alias_method :projects,     :project

      def create(q=1)
        @q = q
        self
      end
    end
  end
end