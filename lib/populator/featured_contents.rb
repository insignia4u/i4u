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
          image: @images.sample
        )
      end
    end

  protected

    def sites
      Site.all
    end
  end
end
