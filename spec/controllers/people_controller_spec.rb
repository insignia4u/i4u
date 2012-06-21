require 'spec_helper'

describe PeopleController do
  describe "Inherited Resources" do
    before :each do
      @people       = mock_model(Person)
      @current_site = mock_model(Site)

      Site.stub!(:first).and_return(@current_site)
      @current_site.stub!(:people).and_return(@people)
      @people.stub!(:all).and_return(@people)
    end

    it "Begin Association" do
      Site.should_receive(:first).and_return(@current_site)
      @current_site.should_receive(:people).and_return(@people)
      @people.should_receive(:all).and_return(@people)
      get :index
      response.should be_success
    end
  end

end
