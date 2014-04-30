# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text "MyText"
    parent_id 1
    article_id 1
    user_id 1
  end
end
