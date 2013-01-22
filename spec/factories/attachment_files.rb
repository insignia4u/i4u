FactoryGirl.define do
  factory :attachment_file do
    sequence(:name) { |n| "attachment file #{n}" }
    summary { (0..10).to_a.sample.even? ? Faker::Lorem.sentence : nil }
    file_i4u { FactoryGirl::AttachmentHelper.uploaded_file }
  end
end
