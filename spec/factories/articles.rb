# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    site

    title               "Some Title"
    subtitle            "Some Subtitle"
    content             "Some Content"
    summary             "Some Summary"
    description         "Some Description"
    publication_date    "2013-05-08"
    publication_state    false
    image_file_name         "pic.jpg"
    image_content_type      "image/jpeg"
    image_file_size         "81386"
    image_updated_at         Time.now
  end
end
