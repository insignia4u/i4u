module Populator
  class Photos
    def new
      @path = File.join(
        Rails.root, 'public', 'populate_images', 'faces',("1".."5").to_a.sample + ".jpg"
      )
    end

    def sample
      File.open(@path)
    end
  end
end
