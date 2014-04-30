# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category, :class => 'Categories' do
    name "MyString"
    slug "MyString"
  end
end
