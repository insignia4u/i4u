# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :newsletter_subscriber do
    email { Faker::Internet.email}
    # on_mail_chimp_list { [true, false].sample}
  end
end
