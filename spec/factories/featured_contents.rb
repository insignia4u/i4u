# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :featured_content do
    site
    name "MyString"
    image { FactoryGirl::AttachmentHelper.uploaded_image }
    body "MyText"
  end
end
