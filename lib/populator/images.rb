module Populator
  class Images
    def new; end

    def sample
      File.open( File.join(
        Rails.root, 'public', 'populate_images',
          ("1".."5").to_a.sample + ".jpg"
      ))
    end
  end
end
