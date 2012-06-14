# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    site
    title
    first_name "Foo First Name"
    last_name  "Foo Last Name"
    bio "Foo Bio"
  end
end
