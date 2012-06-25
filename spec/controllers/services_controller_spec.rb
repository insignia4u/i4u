require 'spec_helper'

describe ServicesController do
  describe "Inherited Resources" do
    before :each do
      @services     = mock_model(Service)
      @current_site = mock_model(Site)

      Site.stub!(:first).and_return(@current_site)
      @current_site.stub!(:services).and_return(@services)
      @services.stub!(:all).and_return(@services)
    end

    it "Begin Association" do
      Site.should_receive(:first).and_return(@current_site)
      @current_site.should_receive(:services).and_return(@services)
      @services.should_receive(:all).and_return(@services)
      get :index
      response.should be_success
    end
  end
end
