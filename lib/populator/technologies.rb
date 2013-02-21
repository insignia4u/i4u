module Populator
  class Technologies
    def initialize
      Technology.delete_all
    end

    def create!(q=1)
      q.times do
        Technology.create( name: Faker::Name.name )
      end
    end
  end
end
