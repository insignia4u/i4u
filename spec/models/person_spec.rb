require 'spec_helper'

describe Person do
    describe "Attributes accessibility" do
    it { should have_accessible(:site_id) }
    it { should have_accessible(:title_id) }
    it { should have_accessible(:first_name) }
    it { should have_accessible(:last_name) }
    it { should have_accessible(:bio) }
  end

  describe "Validations" do
    it { should validate_presence_of(:site) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:bio) }

    describe "specific" do
      before :each do
        @person = Person.new
      end

      context "length" do
        it "requires name to be unique within site scope" do
        @person.bio = ""
        301.times{ @person.bio += "a" }
        @person.should_not be_valid
        @person.should have_at_least(1).errors_on(:bio)
        end
      end
    end
  end

  describe "Photo" do
    before(:each) do
      @person = Person.new
    end

    context "Paperclip behavior" do
      it "respond to photo attachment" do
        @person.should respond_to(:photo)
      end

      it "have a paperclip filed named photo" do
        @person.photo.should be_an_instance_of(Paperclip::Attachment)
      end
    end

    context "validations" do
      it { should have_attached_file(:photo) }
      it { should validate_attachment_presence(:photo) }
      it { should validate_attachment_content_type(:photo).
            allowing('image/png', 'image/jpeg').
            rejecting('text/plain', 'text/xml')
      }
      it { should validate_attachment_size(:photo).less_than(2.megabytes) }
    end
  end
end
