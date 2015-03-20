module Populator
  class Blog
    def initialize
      [Article].each(&:delete_all)
    end

    def populate
      30.times do 
        Article.create! title:  Faker::Name.title.titleize,
          subtitle: Populator.words(0..20).titleize,
          author: Faker::Name.name,
          description: Populator.words(30..130).titleize,
          summary: Faker::Lorem.paragraphs.join('\n'),
          content: Faker::Lorem.paragraphs.join('\n'),
          publication_date: rand(2.years).ago,
          publication_state: 1,
          image: image,
          site_id: Site.all.sample.id,
          created_at: Time.now
      end
    end

    def image
      @images ||= Dir[File.join(Rails.root, 'public', 'populate_images', 'articles')]
      if @images.empty?
        puts "WARNING: Put images on ROOT/public/populate_images/articles to populate articles with proper images."
        nil
      else
        File.open(@images.sample)
      end
    end

  end
end
