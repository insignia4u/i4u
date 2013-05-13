require 'spec_helper'

describe Tip do

  describe "Attributes accessibility" do
    it { should     respond_to(:title) }
    it { should     respond_to(:tip_type) }
    it { should     respond_to(:description) }
    it { should     respond_to(:content) }
    it { should     respond_to(:image) }
    it { should     respond_to(:site) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:tip_type) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:site) }
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

  describe "Finders" do
    before(:each) do
      @rails_tip = create(:rails_tip)
      @today_tip = create(:today_tip)
    end

    context "#rails_tip" do
      it "should return a rails tip" do
        Tip.rails_tip.should eql(@rails_tip)
      end

    end

    context "#today_tip" do
      it "should return a today tip" do
        Tip.today_tip.should eql(@today_tip)
      end

    end
  end

end
