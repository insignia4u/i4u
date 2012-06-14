# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :title do
    sequence(:name) { |n| "Foo Name #{n}" }
  end
end
