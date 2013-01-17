require 'spec_helper'

describe Message do
  let(:message_with_file)    { FactoryGirl.build(:message_with_file) }
  let(:message_without_file) { FactoryGirl.build(:message_without_file) }
  let(:message) { build(:message) }
  describe "valid factories" do
    context "with file" do
      it "has a valid factory" do
        message_with_file.should be_valid
      end
    end

    context "without file" do
      it "has a valid factory" do
        message_without_file.should be_valid
      end
    end
  end

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
    context "Mandatory Fields" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:body) }
      it { should validate_presence_of(:subject) }

      describe "Require attachmente file" do  
        context "when with_file is true" do
          it "is valid wiht attachment file" do
            message_with_file.with_file.should be_true
            message_with_file.file.should_not be_nil 
          end
        end

        context "when with_file is false" do
          it "is invalid without attachment file" do
            message_without_file.with_file.should be_false
            message_without_file.file.should be_nil
          end
        end
      end
    end

    context "Format Validations" do
      it "is invalid wiht a invalid email" do
        message.email = "foo_email"
        message.should_not be_valid
      end

      it "is valid wiht a valid email" do
        message.email = "augusto@insignia4u.com"
        message.should be_valid
      end
    end
  end

  describe "Message Friend persistance" do
    it "never is persisted" do
      message.should_not be_persisted
    end

    it "always is new record" do
      message.should be_new_record
    end
  end
end