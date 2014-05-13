require 'spec_helper'

describe Service do
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
  end
end
