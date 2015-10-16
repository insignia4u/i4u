# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tip do
    site

    tip_type                 1
    sequence(:title)     { |n| "Some Tips Title-#{n}"}
    link                 "http://www.google.com"
    description          "Some Tips Description"
    content              "Some Tips Content"
    published_at         Date.today
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

    factory :rails_tip_future do
      tip_type                0
      sequence(:published_at) { |n| n.days.from_now.at_beginning_of_day }
    end

    factory :today_tip_future do
      tip_type                1
      sequence(:published_at) { |n| n.days.from_now.at_beginning_of_day }
    end

  end
end
