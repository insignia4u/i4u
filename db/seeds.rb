# Seed Default Admin User
puts "*** Creating admin user..."
AdminUser.create!(
  email:                 "admin@insignia4u.com",
  password:              "123123123",
  password_confirmation: "123123123"
)
puts "Done!"

require "populator/sites"

puts "*** Creating sites"
Populator::Sites.new.create!
puts "Done!"
