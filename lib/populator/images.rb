module Populator
  class Images
<<<<<<< HEAD
    def new
      @path = File.join(
        Rails.root, 'public', 'populate_images',("1".."20").to_a.sample + ".JPG"
=======
    def initialize
      @path = File.join(
        Rails.root, 'public', 'populate_images',("1".."10").to_a.sample + ".jpg"
>>>>>>> new-site-integration
      )
    end

    def sample
      File.open(@path)
    end
  end
end
