module Populator
  class Technologies
    def initialize
      Technology.delete_all
    end

    def create!(q=1)
      q.times do
        Technology.create(title: Faker::Name.name,
                          description: Faker::Lorem.sentence(3) )
      end
    end
  end
end
