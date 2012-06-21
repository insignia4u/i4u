# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    sequence(:name)  { |n| "Name #{n}" }
    sequence(:email) { |n| "foo_email_#{n}@insignia4u.com" }
    body             "FOO BODY"
    file             File.open(Rails.root.join('spec', 'support', 'example.jpg'), 'rb')
  end
end
