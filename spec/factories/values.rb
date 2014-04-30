# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :value, :class => 'Value' do
    title "MyString"
    subtitle "MyString"
    description "MyText"
  end
end
