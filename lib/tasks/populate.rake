require "insignia_papulator"

namespace(:db) do
  desc "Populate development database with raw data"
  task :populate => :environment do
    puts "> Populating your database. Please wait..."
    puts "\n*** Creating people."
    Insignia::Populator.create(13).people
    puts "*** Done!"

    puts "\n*** Creating technologies"
    Insignia::Populator.create(10).technologies
    puts "*** Done!"

    puts "\n*** Creating tools"
    Insignia::Populator.create(10).tools
    puts "*** Done!"

    puts "\n*** Creating Project"
    Insignia::Populator.create(20).projects
    puts "*** Done!"

    puts "\n*** Creating Featured Content"
    Insignia::Populator.create(3).featured_content
    puts "*** Done!"
    puts "> Populate task completed!"
  end
end