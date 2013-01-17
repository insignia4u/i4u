# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    name    { Faker::Name.name }
    email   { Faker::Internet.email(name) }
    body    { Faker::Lorem.paragraph(rand(5..10)) }
    subject { Faker::Lorem.sentence(rand(3..7)) }
    
    factory :message_with_file  do
      with_file true
      file { FactoryGirl::AttachmentHelper.uploaded_file }
    end

    factory :message_without_file  do
      with_file false
      file nil
    end
  end
end
