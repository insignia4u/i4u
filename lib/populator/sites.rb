module Populator
  class Sites
    def initialize
      Site.delete_all
    end

    def create!
      [['English Site', 'EN'], ['Spanish Site', 'ES']].each do |site|
        Site.create!(name: site[0], abbreviation: site[1])
      end
    end
  end
end
