# Seed Default Admin User
puts "*** Creating admin user..."
AdminUser.create!(
  email:                 "admin@insignia4u.com",
  password:              "siempre981",
  password_confirmation: "siempre981"
)
puts "Done!"

require "populator/sites"

<<<<<<< HEAD
[['English Site', 'EN'], ['Spanish Site', 'ES']].each do |site|
  Site.create!(name: site[0], abbreviation: site[1])
end

puts "Done."
=======
puts "*** Creating sites"
Populator::Sites.new.create!
puts "Done!"
>>>>>>> 72483c5... [Refactoring] Improve sample images load
