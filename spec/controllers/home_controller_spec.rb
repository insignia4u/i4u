require 'spec_helper'

describe HomeController do
  describe "Loading current site" do
    before :each do
      @current_site = mock_model(Site)

      Site.stub!(:first).and_return(@current_site)
    end

    it "finds current site" do
      Site.should_receive(:first).and_return(@current_site)
      get :show
      assigns[:current_site].should == @current_site
    end
  end
end
