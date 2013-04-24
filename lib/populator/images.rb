module Populator
  class Images
    def initialize
      @path = File.join(
        Rails.root, 'public', 'populate_images',("1".."10").to_a.sample + ".jpg"
      )
    end

    def sample
      File.open(@path)
    end
  end
end
