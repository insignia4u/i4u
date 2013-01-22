require 'spec_helper'

describe ApplicationController do
  describe "current site" do
    before :each do
      @site = FactoryGirl.create(:site)
      Site.stub!(:with_language).with("EN").and_return([@site])
    end

    context "with specific language" do
      it "search site specific language" do
        session[:language] = "es"
        Site.stub!(:with_language).with("ES").and_return([@site])

        subject.send(:current_site).should eq @site
      end
    end

    context "without specific language" do
      it "search site with english language" do
        site = FactoryGirl.create(:site)

        subject.send(:current_site).should eq @site
      end
    end
  end
end
