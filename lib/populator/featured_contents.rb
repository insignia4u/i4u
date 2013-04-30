require "populator/images"

module Populator
  class FeaturedContents
    def initialize
      FeaturedContent.delete_all
      @images = Populator::Images.new
    end

    def create!(q=1)
      q.times do
        FeaturedContent.create!(
          site:  sites.sample,
          name:  Faker::Name.name,
          body:  Faker::Lorem.sentences.join("\n"),
          image: image
        )
      end
    end

  protected

    def sites
      Site.all
    end

    def image
      @image ||= File.open(
        File.join(
          Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"
        )
      )
    end
  end
end
