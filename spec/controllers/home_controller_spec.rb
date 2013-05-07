require 'spec_helper'

describe HomeController do
  describe "Loading current site" do
    before :each do
      site           = FactoryGirl.create(:site, abbreviation: "EN")

      @home_projects = [FactoryGirl.create(:project, site: site),
        FactoryGirl.create(:project, site: site)]

      site.stub!(:home_projects).and_return(@home_projects)
      Site.stub!(:with_language).with("EN").and_return([site])
    end

    describe "GET#show" do
      let(:technologies) { 
        [
      {"title" => 'Ruby on Rails', "icon_type" => 'diamond'},
      {"title" => 'Front-end development: HTML, CSS and Javascript',
        "icon_type" => 'tech'},
      {"title" => 'Kohana (PHP)', "icon_type" => 'php', 
        "icon_text" => 'php'},
      {"title" => 
        'Mobile applications development for iOS and Android platforms', 
        "icon_type" => 'mobile'}
        ]
      }

      let(:tools) { 
        [
      {"title" => 'Behaviour Driven Development', "icon_type" => 'cursor'},
      {"title" => 'Agile methodologies', "icon_type" => 'undo'},
      {"title" => 'Version control system: GIT, SVN and others', 
        "icon_type" => 'site-map'},
      {"title" => 'Pair programming', "icon_type" => 'users'}
    ]}

      it "load featured projects" do
        get :show
        assigns(:featured_projects).should eq @home_projects
      end

      it "load technologies" do
        get :show
        assigns(:technologies).should eq technologies
      end

      it "load tools" do
        get :show
        assigns(:tools).should eq tools
      end
    end
        # it "finds current site" do
    #   Site.should_receive(:first).and_return(@current_site)
    #   get :show
    #   assigns[:current_site].should == @current_site
    # end


  end
end
