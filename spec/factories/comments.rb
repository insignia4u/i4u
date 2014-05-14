FactoryGirl.define do
  factory :comment do
    article

    sequence(:text) { |n| "Comment ##{n}" }
    sequence(:name) { |n| "Author ##{n}" }
  end
end
