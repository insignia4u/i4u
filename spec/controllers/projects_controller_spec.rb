require 'spec_helper'

describe ProjectsController do
  describe "Inherited Resources" do
    before :each do
      @projects     = mock_model(Project)
      @current_site = mock_model(Site)

      Site.stub!(:first).and_return(@current_site)
      @current_site.stub!(:projects).and_return(@projects)
      @projects.stub!(:all).and_return(@projects)
    end

    it "Begin Association" do
      Site.should_receive(:first).and_return(@current_site)
      @current_site.should_receive(:projects).and_return(@projects)
      @projects.should_receive(:all).and_return(@projects)
      get :index
      response.should be_success
    end
  end

  describe "Listing Projects" do
    before :each do
      controller.stub!(:index!)
    end

    it "lists projects" do
      controller.should_receive(:index!)
      get :list
      response.should be_success
    end
  end
end
