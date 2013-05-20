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

  describe "Check Tip type" do
    before(:each) do
      @rails_tip = create(:rails_tip)
      @today_tip = create(:today_tip)
    end
    
    it "return the Right tip string" do
      helper.tip_type(@rails_tip).should == 'Rails Tip'
      helper.tip_type(@today_tip).should == 'Today Tip'
    end
  end
end
