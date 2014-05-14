FactoryGirl.define do
  factory :category do
    site

    sequence(:name) { |n| "Category ##{n}" }
  end
end
