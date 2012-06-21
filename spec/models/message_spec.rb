require 'spec_helper'

describe Message do
  describe "Initialization" do
    it "produces an array loaded with email accounts" do
      @message = Message.new(
        :name  => "Foo Name",
        :email => "foo_email@insignia4u.com",
        :body  => "Foo Body",
      )
      @message.name.should  == "Foo Name"
      @message.email.should == "foo_email@insignia4u.com"
      @message.body.should  == "Foo Body"
    end
  end

  describe "Validations" do
    before(:each) do
      @message = Message.new
    end

    context "Mandatory Fields" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:body) }

      it "requires a valid email to be valid" do
        @message.email = "foo_email"
        @message.should_not be_valid
        @message.should have_at_least(1).errors_on(:email)
      end
    end
  end

  describe "Message Friend persistance" do
    before :each do
      @message = Message.new(
        :name  => "Foo Name",
        :email => "foo_email@insignia4u.com",
        :body  => "Foo Body",
      )
    end

    it "return false" do
      @message.persisted?.should be_false
    end
  end
end