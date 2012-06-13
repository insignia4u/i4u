require 'spec_helper'

describe Project do
  describe "Attributes accessibility" do
    it { should     have_accessible(:name) }
    it { should     have_accessible(:summary) }
    it { should     have_accessible(:description) }
    it { should     have_accessible(:extended_description) }
    it { should     have_accessible(:url) }
    it { should     have_accessible(:started_at) }
    it { should     have_accessible(:ended_at) }
    it { should_not have_accessible(:highlighted) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:extended_description) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:started_at) }
    it { should validate_presence_of(:ended_at) }

    describe "specific" do
      before :each do
        @project = Project.new
      end

      context "uniqueness" do
        before :each do
          @site      = FactoryGirl.create(:site)
          @project_2 = FactoryGirl.create(:project, :site => @site)
        end

        it "require name on site scope" do
          @project.name = @project_2.name
          @project.site = @site
          @project.should_not be_valid
          @project.should have_at_least(1).errors_on(:site_id)
        end
      end

      context "format" do
        it "require a valid url to be valid" do
          @project.url = "foo_url"
          @project.should_not be_valid
          @project.should have_at_least(1).errors_on(:url)
        end
      end
    end
  end

  describe "Highlightion" do
    let(:project) { FactoryGirl.create(:project) }

    context "when marking a project as highlighted" do
      it "should mark the project as highlighted" do
        project.should_not be_highlighted
        lambda {
          project.highlight!
        }.should change(project, :highlighted?).from(false).to(true)
      end
    end

    context "when unhighlighted a project" do
      before(:each) do
        project.highlight!
      end

      it "should mark the project as unhighlight" do
        lambda {
          project.unhighlight!
        }.should change(project, :highlighted).from(true).to(false)
      end
    end
  end
end
