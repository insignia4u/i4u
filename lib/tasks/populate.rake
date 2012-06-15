require "insignia_papulator"

namespace(:db) do
  desc "Populate development database with raw data"
  task :populate => :environment do
    puts "> Populating your database. Please wait..."
    puts "*** Creating people."
    Insignia::Populator.create(13).people
    puts "*** Done!"

    puts "*** Creating technologies"
    Insignia::Populator.create(10).technologies
    puts "*** Done!"

    puts "*** Creating tools"
    Insignia::Populator.create(10).tools
    puts "*** Done!"

    puts "*** Creating Project"
    Insignia::Populator.create(10).projects
    puts "*** Done!"
    puts "> Populate task completed!"
  end
end