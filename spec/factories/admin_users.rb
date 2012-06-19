
FactoryGirl.define do
  factory :admin_user do
    email                 "admin@insignia4u.com"
    password              "123456"
    password_confirmation "123456"
  end
end
