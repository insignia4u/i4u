# Seed Default Admin User
AdminUser.create!(
  email:                 "admin@insignia4u.com",
  password:              "siempre981",
  password_confirmation: "siempre981"
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