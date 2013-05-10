require 'spec_helper'

describe Tip do

  describe "Attributes accessibility" do
    it { should     respond_to(:title) }
    it { should     respond_to(:type) }
    it { should     respond_to(:description) }
    it { should     respond_to(:content) }
    it { should     respond_to(:image) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:content) }
  end

  describe "Factory Definition" do
    it "creates a valid Article" do
      expect{ create(:tip) }.to change{ Tip.count }.by(1)
    end
  end

  describe "Image" do
    before(:each) do
      @tip = Tip.new
    end

    context "Paperclip behavior" do
      it "respond to image attachment" do
        @tip.should respond_to(:image)
      end

      it "have a paperclip filed named image" do
        @tip.image.should be_an_instance_of(Paperclip::Attachment)
      end
    end
  end

end
