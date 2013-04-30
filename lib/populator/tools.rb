module Populator
  class Tools
    def initialize
      Tool.delete_all
    end

    def create!(q=1)
      q.times do
        Tool.create(title: Faker::Name.name,
                    description: Faker::Lorem.sentence(3) )
      end
    end
  end
end
