require "populator/photos"

module Populator
  class People
    def initialize
      Person.delete_all

      @photos = Populator::Photos.new
    end

    def create!(q=1)
      q.times do
        Person.create!(
          site:       sites.sample,
          title:      titles.sample,
          first_name: Faker::Name.first_name,
          last_name:  Faker::Name.last_name,
          bio:        Faker::Lorem.sentence(10),
          photo:      @photos.sample
        )
      end
    end

  protected

    def sites
      Site.all
    end

    def titles
      ['Partner', 'Developer', 'Operation Manager', 'Project Manager']
    end
  end
end
