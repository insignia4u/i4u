require 'spec_helper'

describe ProjectImage do
  describe "Validations" do
    it { should validate_presence_of(:image) }
  end

  describe 'Association' do
    it { should belong_to(:project) }
  end

  describe 'Factory' do
    it 'creates a valid ProjectImage' do
      expect{
        create(:project_image)
      }.to change{ ProjectImage.count }.by(1)
    end
  end

  describe "Image" do
    before(:each) do
      @project_image = ProjectImage.new
    end

    context "Paperclip behavior" do
      it "respond to image attachment" do
        @project_image.should respond_to(:image)
      end

      it "have a paperclip filed named image" do
        @project_image.image.should be_an_instance_of(Paperclip::Attachment)
      end
    end
  end
end
