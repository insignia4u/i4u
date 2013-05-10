require 'spec_helper'

describe FeaturedContent do



  describe "Attributes accessibility" do
    it { should     respond_to(:site) }
    it { should     respond_to(:name) }
    it { should     respond_to(:body) }
    it { should     respond_to(:image)}
    it { should     respond_to(:slug) }
  end

  describe "Validations" do
    it { should validate_presence_of(:site) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
  end

  describe "Factory Definition" do
    it "creates a valid FeaturedContent" do
      expect { create(:featured_content) }
      .to change{ FeaturedContent.count }.by(1)
    end
  end

  describe "Image" do
    before(:each) do
      @featured_content = FeaturedContent.new
    end

    context "Paperclip behavior" do
      it "respond to image attachment" do
        @featured_content.should respond_to(:image)
      end

      it "have a paperclip filed named image" do
        @featured_content.image.should be_an_instance_of(Paperclip::Attachment)
      end
    end
  end

end
