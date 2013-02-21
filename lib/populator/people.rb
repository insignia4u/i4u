module Populator
  class People
    def initialize
      Person.delete_all
    end

    def create!(q=1)
      q.times do
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

  protected

    def sites
      Site.all
    end

    def titles
      ['Partner', 'Developer', 'Operation Manager', 'Project Manager']
    end

    def photo
      File.open(File.join(Rails.root, 'public', 'populate_images', 'faces',("1".."5").to_a.sample + ".JPG"))
    end
  end
end
