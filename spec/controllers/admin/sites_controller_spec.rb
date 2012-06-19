require 'spec_helper'

describe Admin::SitesController do
  login_admin

  describe "Marking Project like live" do
    before :each do
      @site = mock_model(Site)

      Site.stub!(:find).and_return(@site)
      @site.stub!(:live!)
    end

    it "lives a request site" do
      Site.should_receive(:find).with("1").and_return(@site)
      @site.should_receive(:live!).and_return(true)
      put :live, :id => "1"
      response.should be_redirect
    end
  end

  describe "Unmarking site like hide" do
    before :each do
      @site = mock_model(Site)

      Site.stub!(:find).and_return(@site)
      @site.stub!(:hide!)
    end

    it "hide a request site" do
      Site.should_receive(:find).with("1").and_return(@site)
      @site.should_receive(:hide!).and_return(true)
      put :hide, :id => "1"
      response.should be_redirect
    end
  end
end