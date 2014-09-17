# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    site
    sequence(:name) { |n| "Name #{n}" }
    summary "Foo Summary"
    description "Foo Description"
    extended_description "Foo Extended Description"
    url "http://www.insignia4u.com"
    started_at { "2000-06-13" }
    ended_at   { "2001-06-14" }
    highlighted false
    published true
    image_file_name    "pic.jpg"
    image_content_type "image/jpeg"
    image_file_size    "81386"
    image_updated_at   Time.now
    featured_image_file_name    "pic.jpg"
    featured_image_content_type "image/jpeg"
    featured_image_file_size    "81386"
    featured_image_updated_at   Time.now
  end
end
