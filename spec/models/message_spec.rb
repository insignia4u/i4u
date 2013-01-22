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

  describe "Contact message initialization" do
    context "the message is to contact" do
      it "the subject is null" do
        @contact_message = Message.new(is_to_job: false)

        @contact_message.subject.should be_nil
      end
    end

    context "the message is to jobs" do
      it "the subject is set" do
        @contact_message = Message.new(is_to_job: true,  name: "Augusto Pedraza")

        @contact_message.subject.should eq "CV to Augusto Pedraza"
      end
    end

    it "produces an array loaded with email accounts" do
      @message = Message.new(
        :name  => "Foo Name",
        :email => "foo_email@insignia4u.com",
        :body  => "Foo Body",
      )
      @message.name.should  eq "Foo Name"
      @message.email.should eq "foo_email@insignia4u.com"
      @message.body.should  eq "Foo Body"
    end
  end

  describe "Validations" do
    context "Mandatory Fields" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:body) }

      describe "Require attachmente file" do  
        context "when is to job" do
          let(:message_to_job_without_file){ FactoryGirl.build(:message_without_file, is_to_job: true) }
          let(:message_to_job_with_file){ FactoryGirl.build(:message_with_file, is_to_job: true) }

          it "is valid with attachment file" do
            message_to_job_with_file.should be_valid
          end

          it "is invalid without attachment file" do
            message_to_job_without_file.should be_invalid
          end
        end

        context "when with_file is false" do
          let(:message_not_job_without_file){ FactoryGirl.build(:message_without_file, is_to_job: false) }
          let(:message_not_job_with_file){ FactoryGirl.build(:message_with_file, is_to_job: false) }

          it "is valid without attachment file" do
            message_not_job_without_file.should be_valid
          end

          it "is valid with attachment file" do
            message_not_job_with_file.should be_valid
          end
        end
      end

      describe "Require subject field" do 
        context "to one message to job" do
          let (:message) do
            Message.new(name: "Augusto", body: Faker::Lorem.sentences(5),
              email: "augusto@insignia4u.com", is_to_job: true,
              file: FactoryGirl::AttachmentHelper.uploaded_file)
          end

          it "is valid without specifiy subject" do
            message.should be_valid
          end
        end

        context "to one message to contact" do
          let (:message) do
            Message.new(name: "Augusto", body: Faker::Lorem.sentences(5),
              email: "augusto@insignia4u.com", is_to_job: false)
          end

          it "is invalid without specifiy subject" do
            message.should_not be_valid
          end
        end
      end
    end

    context "Format Validations" do
      it "is invalid with a invalid email" do
        message.email = "foo_email"
        message.should_not be_valid
      end

      it "is valid with a valid email" do
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