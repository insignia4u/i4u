module Populator
  class Tips
    def initialize
      Tip.delete_all
    end

    def populate
      Tip.populate 35 do |tip|
        tip.title = Faker::Name.title.titleize
        tip.link  = "http://www.google.com"
        tip.description = Populator.words(10..30).titleize
        tip.content = Faker::Lorem.paragraphs
        tip.published_at = 2.years.ago..Time.now
        tip.site_id = Site.all.sample.id
        tip.created_at = Time.now
        tip.tip_type = (0..1)
      end
    end
  end
end
