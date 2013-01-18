require 'spec_helper'

describe PeopleController do
  describe "Inherited Resources" do
    before :each do
      @people = []
      @current_site = mock_model(Site)
      2.times { @people << mock_model(Person, site: @current_site) }
      Site.stub!(:with_language).and_return([@current_site])
      @current_site.stub!(:people).and_return(@people)
      @people.stub!(:by_position)
    end

    it "Collection" do
      @current_site.should_receive(:people).and_return(@people)
      @people.should_receive(:by_position)

      get :index

    end
  end
end
