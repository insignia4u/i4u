# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_section do
    site
    name "Foo Bar"
    url  "/"
  end
end
