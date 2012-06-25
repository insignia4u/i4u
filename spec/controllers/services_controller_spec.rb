require 'spec_helper'

describe ServicesController do
  describe "Inherited Resources" do
    before :each do
      @services       = mock_model(Service)
      @current_site   = mock_model(Site)
      @text_snippet   = mock_model(TextSnippet)
      @text_snippet_2 = mock_model(TextSnippet)

      Site.stub!(:first).and_return(@current_site)
      @current_site.stub!(:services).and_return(@services)
      @services.stub!(:all).and_return(@services)
      controller.stub!(:load_texts).and_return(@text_snippet)
    end

    it "Begin Association" do
      Site.should_receive(:first).and_return(@current_site)
      @current_site.should_receive(:services).and_return(@services)
      @services.should_receive(:all).and_return(@services)
      get :index
      response.should be_success
    end

    it "Finds texts" do
      controller.should_receive(:load_texts).with(['our-services', 'our-process']).and_return(@text_snippet)
      controller.should_receive(:load_texts).with(['how-we-do-it', 'our-capabilities']).and_return(@text_snippet_2)
      get :index
      assigns[:main_text].should == @text_snippet
      assigns[:side_text].should == @text_snippet_2
    end
  end
end
