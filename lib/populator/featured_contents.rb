<<<<<<< HEAD
require "populator/images"

=======
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
module Populator
  class FeaturedContents
    def initialize
      FeaturedContent.delete_all
<<<<<<< HEAD

      @images = Populator::Images.new
=======
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
    end

    def create!(q=1)
      q.times do
        FeaturedContent.create!(
          site:  sites.sample,
          name:  Faker::Name.name,
          body:  Faker::Lorem.sentences.join("\n"),
<<<<<<< HEAD
          image: @images.sample
=======
          image: image
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
        )
      end
    end

  protected

    def sites
      Site.all
    end
<<<<<<< HEAD
=======

    def image
      @image ||= File.open(
        File.join(
          Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"
        )
      )
    end
>>>>>>> 16b5094... [Refactoring] Reorganizing Populator
  end
end
