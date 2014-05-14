FactoryGirl.define do
  factory :tool do
    sequence(:title) { |n| "Tool ##{n}" }
    sequence(:description) { |n| "Tool ##{n} Description" }
  end
end
