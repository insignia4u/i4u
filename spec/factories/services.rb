# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    site
    sequence(:title) { |n| "Foo title #{n}" }
    summary          "Foo Summary"
  end
end
