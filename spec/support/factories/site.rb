FactoryGirl.define do
  factory :site do
    name           "Foo Bar Site"
    abbreviation   { ("aa".."zz").to_a.sample }
  end
end
