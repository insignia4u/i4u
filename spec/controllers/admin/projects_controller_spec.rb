require 'spec_helper'

describe Admin::ProjectsController do
  login_admin

  describe "Marking Project like featured" do
    before :each do
      @project = mock_model(Project)

      Project.stub!(:find).and_return(@project)
      @project.stub!(:highlight!)
    end

    it "highlight a request project" do
      Project.should_receive(:find).with("1").and_return(@project)
      @project.should_receive(:highlight!).and_return(true)
      put :highlight, :id => "1"
      response.should be_redirect
    end
  end

  describe "Unmarking Project like featured" do
    before :each do
      @project = mock_model(Project)

      Project.stub!(:find).and_return(@project)
      @project.stub!(:unhighlight!)
    end

    it "unhighlight a request project" do
      Project.should_receive(:find).with("1").and_return(@project)
      @project.should_receive(:unhighlight!).and_return(true)
      put :unhighlight, :id => "1"
      response.should be_redirect
    end
  end
end