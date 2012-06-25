require 'spec_helper'

describe 'visiting the homepage' do
  describe "GET /" do
    before :each do
      @site    = FactoryGirl.create(:site)
      @project = FactoryGirl.create(:project, :site => @site)
      @text    = FactoryGirl.create(:text_snippet, :name => 'Home Welcome')
    end

    context "Listing proejcts" do
      it "Displays projects list" do
        visit root_path
        page.should have_content(@project.name)
        page.should have_content(@project.summary)
      end
    end

    context "Listing texts" do
      it "Displays texts" do
        visit root_path
        page.should have_content(@text.body)
      end
    end

    context "Listing Technologies" do
      before :each do
        @technology = FactoryGirl.create(:technology)
      end

      it "Displays technologies list" do
        visit root_path
        page.should have_content(@technology.name)
      end
    end

    context "Listing Tools" do
      before :each do
        @tool = FactoryGirl.create(:tool)
      end

      it "Displays tool list" do
        visit root_path
        page.should have_content(@tool.name)
      end
    end
  end
end
