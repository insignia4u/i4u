FactoryGirl.define do
  factory :value do
    site

    sequence(:title) { |n| "Value ##{n}" }
    sequence(:subtitle) { |n| "Value Subtitle ##{n}" }
    sequence(:description) { |n| "Value Description ##{n}" }
  end
end
