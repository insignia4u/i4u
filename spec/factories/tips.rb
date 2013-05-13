# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tip do
    site

    tip_type                 1
    sequence(:title)     { |n| "Some Title-#{n}"}
    description          "Some Description"
    content              "Some Content"
    image_file_name      "pic.jpg"
    image_content_type   "image/jpeg"
    image_file_size      "81386"
    image_updated_at     Time.now

    factory :rails_tip do
      tip_type            0
    end

    factory :today_tip do
      tip_type            1
    end
  end
end
