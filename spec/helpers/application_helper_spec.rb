require 'spec_helper'

describe ApplicationHelper do
  describe "First resrouce of collection" do
    before :each do
      @project_1 = FactoryGirl.create(:project)
      @project_2 = FactoryGirl.create(:project)
      @project_3 = FactoryGirl.create(:project)

      @projects = Project.all
    end

    it "returns css class" do
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

    it "returns css class" do
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

    it "returns the Right tip string" do
      helper.tip_type(@rails_tip).should == 'Rails Tips'
      helper.tip_type(@today_tip).should == 'Today Tips'
    end
  end

  describe "tip_prev_year" do
    before(:each) do
      @date = Date.today
      @type = Tip::TODAY_TIP
    end

    it "reutrns the tip path to previous year" do
      helper.tip_prev_year(@type, @date).should
        eql(blog_tips_path(@type , month: 1, year: (@date - 1.year).year))
    end
  end

  describe "tip_next_year" do
    before(:each) do
      @date = Date.today
      @type = Tip::TODAY_TIP
    end

    it "reutrns the tip path to previous year" do
      helper.tip_prev_year(@type, @date).should
        eql(blog_tips_path(@type , month: 1, year: (@date - 1.year).year))
    end
  end

  describe "tip_month_name" do
    it "returns the month name abreviated" do
      helper.tip_month_name(1).should eq('JAN')
    end
  end

  describe "tip_month_path" do
    before(:each) do
      @date = Date.today
      @month = 2
      @type = Tip::TODAY_TIP
    end

    it "returns the month path of number of month" do
      helper.tip_month_path(@type, @month, @date).should
        eq(blog_tips_path(@type, month: @month, year: @date.year))
    end
  end

  describe "tip_month_class" do
    before(:each) do
      @current_date = Date.today
      @current_month = Date.today.month
      @old_date = DateTime.parse("2013-05-19 10:30:00")
      @enable_month = @old_date.month + 1
      @disable_month = @current_date.month + 1
    end

    it "returns the current month class to tips paginator" do
      helper.tip_month_class(@current_month, @current_date).should eq("month-current")
    end

    it "returns the enable month class to tips paginator" do
      helper.tip_month_class(@enable_month, @old_date).should eq("month-enable")
    end

    it "returns the disable month class to tips paginator" do
      helper.tip_month_class(@disable_month, @current_date).should eq("month-disable")
    end
  end

  describe "tip_inactive_month?" do
    before(:each) do
      @current_date = Date.today
      @current_month = Date.today.month
      @future_month = Date.today.month + 1
    end

    it "returns true for inactive month" do
      helper.tip_inactive_month?(@future_month, @current_date).should be_true
    end

    it "returns true for inactive month" do
      helper.tip_inactive_month?(@current_month, @current_date).should be_false
    end
  end

  describe "title" do
    before(:each) do
      @text = "Title"
    end
    it "should output content for title" do
      helper.title(@text).should == @text
    end
  end
end
