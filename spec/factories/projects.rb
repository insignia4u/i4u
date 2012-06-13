# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    site
    sequence(:name) { |n| "Name #{n}" }
    summary "Foo Summary"
    description "Foo Description"
    extended_description "Foo Extended Description"
    url "http://www.insignia4u.com"
    started_at "2012-06-13"
    ended_at "2012-06-13"
    highlighted false
  end
end
