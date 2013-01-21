require 'spec_helper'

describe 'visiting the homepage' do
  describe "GET /" do
    before :each do
      @site    = FactoryGirl.create(:site, abbreviation: "EN")
      @project = FactoryGirl.create(:project, :site => @site)
      @featured_projects = []
      3.times { @featured_projects << FactoryGirl.create(:project, :site => @site, highlighted: true)}
    end

    context "Listing main content" do
      it "Displays succesfull projects" do
        visit root_path
        page.should have_content "SUCCESSFUL PROJECTS"

        @featured_projects.each do |project|
          page.should have_content project.name
          page.should have_content project.summary
        end
      end
    end
  end
end
