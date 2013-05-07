# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    name    { Faker::Name.name }
    email   { Faker::Internet.email(name) }
    body    { Faker::Lorem.paragraph(rand(5..10)) }
    phone   8421158323
    
    factory :message_with_file  do
      is_to_job true
      file { FactoryGirl::AttachmentHelper.uploaded_file }
    end

    factory :message_without_file  do
      is_to_job false
      file nil
    end
  end
end
