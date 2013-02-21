module Populator
  class Images
    def new
      @path = File.join(
        Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"
      )
    end

    def sample
      File.open(@path)
    end
  end
end
