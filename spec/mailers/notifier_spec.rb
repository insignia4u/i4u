require "spec_helper"

describe Notifier do
  describe "Contact Email" do
    before :each do
      @message  = FactoryGirl.build(:message)
      @expected = Notifier.contact_message(@message)
    end

    it "renders the subject" do
      @expected.subject.should eq "Contact from: Insignia website"
    end

    it 'renders the sender email' do
      @expected.from.should eq [@message.email]
    end

    it "renders the receiver email" do
      @expected.to.should eq(['contacto@insignia4u.com'])
    end

    context "with attachment file" do
      before :each do
        @message  = FactoryGirl.build(:message_with_file)
        @expected = Notifier.contact_message(@message)
      end

      it "renders the attachment file" do
        @expected.attachments.first.filename.should eq @message.file.original_filename
        @expected.attachments.first.should_not eq be_nil
      end
    end

    context "without attachment file" do
      before :each do
        @message  = FactoryGirl.build(:message_without_file)
        @expected = Notifier.contact_message(@message)
      end

      it "renders the nil" do
        @expected.attachments.first.should be_nil
      end
    end

    it "renders the body" do
      @expected.body.encoded.should match("#{@message.name}")
      @expected.body.encoded.should match("#{@message.body}")
    end
  end
end
