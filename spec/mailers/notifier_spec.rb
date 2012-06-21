require "spec_helper"

describe Notifier do
  describe "Contact Email" do
    before :each do
      @message  = FactoryGirl.build(:message)
      @expected = Notifier.contact_message(@message)
    end

    it "renders the subject" do
      @expected.subject.should == "New Contact Message"
    end

     it 'renders the sender email' do
      @expected.from.should == [@message.email]
    end

    it "renders the receiver email" do
      @expected.to.should eq(['contacto@insignia4u.com'])
    end

    it "renders the body" do
      @expected.body.encoded.should match("#{@message.name}")
      @expected.body.encoded.should match("#{@message.body}")
    end
  end
end
