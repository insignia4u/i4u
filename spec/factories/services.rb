# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    site
    sequence(:title) { |n| "Foo title #{n}" }
    sequence(:summary) { |n| "Service ##{n} Summary" }

    image_file_name    "pic.jpg"
    image_content_type "image/jpeg"
    image_file_size    "81386"
    image_updated_at   Time.now
  end
end
