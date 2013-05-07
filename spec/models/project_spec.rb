require 'spec_helper'

describe Project do
  describe "Attributes accessibility" do
    it { should     respond_to(:name) }
    it { should     respond_to(:summary) }
    it { should     respond_to(:description) }
    it { should     respond_to(:extended_description) }
    it { should     respond_to(:url) }
    it { should     respond_to(:started_at) }
    it { should     respond_to(:ended_at) }
    it { should     respond_to(:technology_ids) }
    it { should     respond_to(:tool_ids) }
    it { should     respond_to(:highlighted) }
  end

  describe "Validations" do
    it { should validate_presence_of(:site) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:image) }

    describe "specific" do
      before :each do
        @project = Project.new
      end

      context "uniqueness" do
        before :each do
          @site    = FactoryGirl.create(:site)
          @project = FactoryGirl.build(:project)

          @site.projects << @project
        end

        it "requires name to be unique within site scope" do
          lambda {
            @site.projects << @project
          }.should_not change(Project, :count).from(Project.count).to(Project.count + 1)

          lambda {
            @site.projects << FactoryGirl.build(:project)
          }.should change(Project, :count).from(Project.count).to(Project.count + 1)
        end
      end

      context "format" do
        it "requires a valid url to be valid" do
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

      it "should return 'Yes' as current project state" do
        project.highlight!
        project.highlight_state.should == "Yes"
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

      it "should return 'No' as current project state" do
        project.unhighlight!
        project.highlight_state.should == "No"
      end
    end
  end

  describe "Images" do
    before(:each) do
      @project = Project.new
    end

    context "Paperclip behavior" do
      it "respond to image attachment" do
        @project.should respond_to(:image)
      end

      it "respond to featured image attachment" do
        @project.should respond_to(:featured_image)
      end

      it "have a paperclip filed named Image" do
        @project.image.should be_an_instance_of(Paperclip::Attachment)
      end

      it "have a paperclip filed named Featured Image" do
        @project.featured_image.should be_an_instance_of(Paperclip::Attachment)
      end
    end

    context "validations" do
      it { should have_attached_file(:image) }
      it { should validate_attachment_presence(:image) }
      it { should validate_attachment_content_type(:image).
            allowing('image/png', 'image/jpeg').
            rejecting('text/plain', 'text/xml')
      }

      it { should have_attached_file(:featured_image) }
      it { should validate_attachment_content_type(:featured_image).
            allowing('image/png', 'image/jpeg').
            rejecting('text/plain', 'text/xml')
      }

      it "should invalid without started_at and a ended_at" do
        project = build(:project, started_at: nil, ended_at: DateTime.yesterday)
        project.should_not be_valid 
      end
    end
  end

  describe "class methods" do
    before :each do
      @yesterday = create(:project, created_at: DateTime.yesterday)
      @today     = create(:project, created_at: DateTime.now)
      @tomorrow  = create(:project, created_at: DateTime.tomorrow)
    end

    describe "list recent jobs" do
      context "with n" do
        it "list the n projects order by creation date in descending order" do
          Project.recent_jobs(2).should eq [@tomorrow, @today]
        end
      end

      context "without n" do
        it "list the 3 projects order by creation date in descending order" do
          Project.recent_jobs.should eq [@tomorrow, @today, @yesterday]
        end
      end
    end
  end
end
