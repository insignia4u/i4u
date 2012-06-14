# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_technology, :class => 'ProjectTechnology' do
    project
    technology
  end
end
