require 'spec_helper'

describe ApplicationHelper do
  describe "First resrouce of collection" do
    before :each do
      @project_1 = FactoryGirl.create(:project)
      @project_2 = FactoryGirl.create(:project)
      @project_3 = FactoryGirl.create(:project)

      @projects = Project.all
    end

    it "return css class" do
      helper.first_project(@projects, @projects.first).should  == 'first'
      helper.first_project(@projects, @projects.second).should == ''
      helper.first_project(@projects, @projects.last).should   == ''
    end
  end
end
