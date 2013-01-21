# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text_snippet do
    site
    sequence(:name) { |n| "Foo name #{n}" }
    title           "Foo title"
    body            { Faker::Lorem.sentence(200)}
  end
end
