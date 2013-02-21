<<<<<<< HEAD
require "populator/photos"

=======
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
module Populator
  class People
    def initialize
      Person.delete_all
<<<<<<< HEAD

      @photos = Populator::Photos.new
=======
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
    end

    def create!(q=1)
      q.times do
        Person.create!(
          site:       sites.sample,
          title:      titles.sample,
          first_name: Faker::Name.first_name,
          last_name:  Faker::Name.last_name,
          bio:        Faker::Lorem.sentence(10),
<<<<<<< HEAD
          photo:      @photos.sample
=======
          photo:      photo
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
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
<<<<<<< HEAD
=======

    def photo
      File.open(File.join(Rails.root, 'public', 'populate_images', 'faces',("1".."5").to_a.sample + ".JPG"))
    end
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
  end
end
