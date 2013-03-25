# Seed Default Admin User
puts "*** Creating admin user..."
AdminUser.create!(
  email:                 "admin@example.com",
  password:              "please_change_me",
  password_confirmation: "please_change_me"
)
puts "Done!"

require "populator/sites"

puts "*** Creating sites"
Populator::Sites.new.create!
puts "Done!"
