# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    site

    sequence(:title)        {|n| "Some Title-#{n}"   }
    author                  "Some Author"
    subtitle                "Some Subtitle"
    content                 "Some Content"
    summary                 "Some Summary"
    description             "Some Description"
    publication_date        "2013-05-08"
    publication_state        false
    image_file_name         "pic.jpg"
    image_content_type      "image/jpeg"
    image_file_size         "81386"
    image_updated_at         Time.now
    tag_list                "Example Tag List"

    factory :article_with_tags do
      tag_list              "Tag1, Tag2, Tag3"
    end
  end
end
