module Populator
  class Blog
    def initialize
      [Article, ActsAsTaggableOn::Tag].each(&:delete_all)
    end

    def populate
      Article.populate 30 do |article|
        article.title = Faker::Name.title.titleize
        article.subtitle = Populator.words(0..20).titleize
        article.author = Faker::Name.name
        article.description = Populator.words(30..130).titleize
        article.summary = Faker::Lorem.paragraphs.join('\n')
        article.content = Faker::Lorem.paragraphs.join('\n')
        article.publication_date = 2.years.ago..Time.now
        article.publication_state = 1
        article.image_file_name = 'default.png'
        article.site_id = Site.all.sample.id
        article.created_at = Time.now
      end
    end
  end
end
