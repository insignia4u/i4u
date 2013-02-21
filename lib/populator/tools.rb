module Populator
  class Tools
    def initialize
      Tool.delete_all
    end

    def create!(q=1)
      q.times do
        Tool.create( name: Faker::Name.name )
      end
    end
  end
end
