FactoryGirl.define do
  factory :site do
    sequence(:name) { |n| "Site ##{n}" }
    sequence(:abbreviation) { |n| "si-#{n}" }
  end
end
