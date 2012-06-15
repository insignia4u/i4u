# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed Default Admin User
AdminUser.create!(
  email:                 "admin@insignia4u.com",
  password:              "123456",
  password_confirmation: "123456"
)

# Seed Default Titles
puts "Creating Titles..."

['Partner', 'Developer', 'Operation Manager', 'Project Manager'].each do |title|
  Title.create!(name: title)
end

puts "Done."

# Seed Default Sites
puts "Creating Sites..."

[['English Site', 'EN'], ['Spanish Site', 'ES']].each do |site|
  Site.create!(name: site[0], abbreviation: site[1])
end

puts "Done."
