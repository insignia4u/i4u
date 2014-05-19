require 'spec_helper'

describe ProjectTechnology do
  describe "Validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:technology) }

    describe "specific" do
      context "uniqueness" do
        before :each do
          @pt         = FactoryGirl.build(:project_technology)
          @project    = FactoryGirl.create(:project)
          @technology = FactoryGirl.create(:technology)

          @pt.project    = @project
          @pt.technology = @technology
        end

        it "requires technology to be unique within project scope" do
          ProjectTechnology.count.should == 0

          @pt.technology = @technology

          lambda {
            @pt.save
          }.should_not change(ProjectTechnology, :count).from(1).to(2)
        end
      end
    end
  end
end
