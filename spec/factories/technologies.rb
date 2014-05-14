FactoryGirl.define do
  factory :technology do
    sequence(:title) { |n| "Technology ##{n}" }
    sequence(:description) { |n| "Technology ##{n} description" }
  end
end
