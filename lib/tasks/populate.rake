namespace(:db) do
  namespace(:populator) do
    task :setup => :environment do
      require 'faker'
      require "populator/sites"
      require "populator/technologies"
      require "populator/tools"
      require "populator/people"
      require "populator/projects"
      require "populator/featured_contents"
      require "populator/blog"
      require "populator/tips"
    end

    desc "Populate development database with raw data"
    task :load => :setup do
      puts "> Populating your database. Please wait..."
      puts "> *** Setting up populators."
      sites             = Populator::Sites.new
      technologies      = Populator::Technologies.new
      tools             = Populator::Tools.new
      people            = Populator::People.new
      projects          = Populator::Projects.new
      featured_contents = Populator::FeaturedContents.new
      blog              = Populator::Blog.new
      tip               = Populator::Tips.new
      puts "> *** Done!"

      puts "> *** Populating support data."
      sites.create!
      technologies.create!(5)
      tools.create!(5)
      puts "> *** Done!"

      puts "> *** Populating people."
      people.create!(15)
      puts "> *** Done!"

      puts "> *** Populating projects."
      projects.create!(10)
      puts "> *** Done!"

      puts "> *** Populating featured contents."
      featured_contents.create!(10)
      puts "> *** Done!"

      system 'rake sites:en:load_text_snippets'

      puts "> *** Populating blog."
      blog.populate
      puts "> *** Done!"

      puts "> *** Populating tip."
      tip.populate
      puts "> *** Done!"

     puts "> Database Population process complete!"
    end
  end
end
