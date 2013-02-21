# Seed Default Admin User
puts "*** Creating admin user..."
AdminUser.create!(
  email:                 "admin@insignia4u.com",
  password:              "siempre981",
  password_confirmation: "siempre981"
)
puts "Done!"

require "populator/sites"

puts "*** Creating sites"
Populator::Sites.new.create!
puts "Done!"
