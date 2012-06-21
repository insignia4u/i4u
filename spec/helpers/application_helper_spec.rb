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
      helper.first_resource(@projects, @projects.first).should  == 'first'
      helper.first_resource(@projects, @projects.second).should == ''
      helper.first_resource(@projects, @projects.last).should   == ''
    end
  end

  describe "Last resrouce of collection" do
    before :each do
      @project_1 = FactoryGirl.create(:project)
      @project_2 = FactoryGirl.create(:project)
      @project_3 = FactoryGirl.create(:project)

      @projects = Project.all
    end

    it "return css class" do
      helper.last_resource(@projects, @projects.first).should  == ''
      helper.last_resource(@projects, @projects.second).should == ''
      helper.last_resource(@projects, @projects.last).should   == 'last'
    end
  end
end
