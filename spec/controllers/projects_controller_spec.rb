require 'spec_helper'

describe ProjectsController do
  describe "Inherited Resources" do
    before :each do
      @projects = mock_model(Project)

      controller.stub!(:current_site).and_return(@site)
      @site.stub!(:projects).and_return(@projects)
    end

    it "Begin Association" do
      controller.stub!(:current_site).and_return(@site)
      @site.stub!(:projects).and_return(@projects)
      get :index
      response.should be_success
    end
  end
end
