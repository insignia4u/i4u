require 'spec_helper'

describe Site do
  describe "attributes accessibility" do
    it { should     have_accessible(:name) }
    it { should     have_accessible(:abbreviation) }
    it { should_not have_accessible(:live) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:abbreviation) }
    it { should validate_uniqueness_of(:abbreviation) }
  end

  describe "Publication" do
    let(:site) { FactoryGirl.create(:site) }

    context "when marking a site as live" do
      it "should mark the site as live" do
        site.should_not be_live
        lambda {
          site.live!
        }.should change(site, :live?).from(false).to(true)
      end

      it "should present the site as available" do
        site.live!
        site.should be_available
      end

      it "should return 'Live' as current publication state" do
        site.live!
        site.publication_state.should == "Live"
      end
    end

    context "when hiding a site" do
      before(:each) do
        site.live!
      end

      it "should mark the site as hidden" do
        lambda {
          site.hide!
        }.should change(site, :live).from(true).to(false)
      end

      it "should present the site as unavailable" do
        site.hide!
        site.should_not be_available
      end

      it "should return 'Hidden' as current publication state" do
        site.hide!
        site.publication_state.should == "Hidden"
      end
    end
  end

  describe "Finders" do
    describe "Listing Projects" do
      before :each do
        @site      = FactoryGirl.create(:site)
        @highlighted_projects  = []

        5.times{|i| @highlighted_projects << FactoryGirl.create(:project, :site => @site, highlighted: true) }
        4.times{ FactoryGirl.create(:project, :site => @site, highlighted: false) }
      end

      it "list highlighted three projects for Home Page" do
        @site.home_projects.count.should eq 3
      end

      it "list three featured content for Home Page" do
        featured_contents = []

        3.times{ featured_contents << FactoryGirl.create(:featured_content, :site_id => @site.id) }
        FactoryGirl.create(:featured_content, :site => @site)

        @site.home_content.should eq featured_contents
      end

      it "list the featured projects" do
        @site.featured_projects.should eq @highlighted_projects
      end
      
      it "list the projects order by creation date in descending order" do
        site      = create(:site)
        yesterday = create(:project, :site => site, created_at: DateTime.yesterday)
        today     = create(:project, :site => site, created_at: DateTime.now)
        tomorrow  = create(:project, :site => site, created_at: DateTime.tomorrow)

        site.projects_by_created_date.should eq [tomorrow, today, yesterday]
      end
    end
  end
end
