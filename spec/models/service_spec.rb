require 'spec_helper'

describe Service do
  describe "Attributes accessibility" do
    it { should have_accessible(:site_id) }
    it { should have_accessible(:title) }
    it { should have_accessible(:summary) }
    it { should have_accessible(:image) }
  end

  describe "Validations" do
    it { should validate_presence_of(:site) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
  end

  describe "Images" do
    before(:each) do
      @service = Service.new
    end

    context "Paperclip behavior" do
      it "respond to image attachment" do
        @service.should respond_to(:image)
      end

      it "have a paperclip filed named Image" do
        @service.image.should be_an_instance_of(Paperclip::Attachment)
      end
    end

    context "validations" do
      it { should have_attached_file(:image) }
      it { should validate_attachment_presence(:image) }
      it { should validate_attachment_content_type(:image).
            allowing('image/png', 'image/jpeg').
            rejecting('text/plain', 'text/xml')
      }
    end
  end
end
