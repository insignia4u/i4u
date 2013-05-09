# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    site

    title "Some Title"
    subtitle "Some subtitle"
    content 'Some content'
    summary "Some Summary"
    publication_date "2013-05-08"
    publication_state false
  end
end
