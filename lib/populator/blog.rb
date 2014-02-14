module Populator
  class Blog
    def initialize
      [Article, ActsAsTaggableOn::Tag].each(&:delete_all)
    end

    def populate
      Article.populate 30 do |article|
        article.title = Populator.words(1..10).titleize
        article.subtitle = Populator.words(0..20).titleize
        article.author = Faker::Name.name
        article.description = Populator.words(30..130).titleize
        article.summary = Populator.words(10..30).titleize
        article.content = Populator.words(50..300).titleize
        article.publication_date = 2.years.ago..Time.now
        article.publication_state = 1
        article.image_file_name = 'default.png'
        article.site_id = 1
        article.created_at = Time.now
      end
    end
  end
end
