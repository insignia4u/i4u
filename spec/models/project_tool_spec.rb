require 'spec_helper'

describe ProjectTool do
  describe "Validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:tool) }

    describe "specific" do
      context "uniqueness" do
        before :each do
          @pt      = FactoryGirl.build(:project_tool)
          @project = FactoryGirl.create(:project)
          @tool    = FactoryGirl.create(:tool)

          @pt.project = @project
          @pt.tool    = @tool
        end

        it "requires tool to be unique within project scope" do
          ProjectTool.count.should == 0

          @pt.tool = @tool

          lambda {
            @pt.save
          }.should_not change(ProjectTool, :count).from(1).to(2)
        end
      end
    end
  end
end
