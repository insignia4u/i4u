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

#Sedd Default Text Snippet
puts "Creating Text Snippet..."

Site.all.each do |site|
  ['Home Welcome', 'Contact', 'Job', 'How we do it', 'Our Capabilities', 'Our Services'
    'Our Process', 'The Road', 'Who we are', 'Company'].each do |ts|
    TextSnippet.create!(name: st, body: "")
  end
end

puts "Done."
