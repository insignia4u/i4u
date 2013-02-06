require 'spec_helper'

describe NewsletterSubscriber do

  describe "EmailValidator" do

    before(:each) do
      @validator  = EmailValidator.new({:attributes => {}})
      @subscriber = mock_model('NewsletterSubscriber')
      @subscriber.stub("errors").and_return([])
      @subscriber.errors.stub('[]').and_return({})
      @subscriber.errors[].stub('<<')
    end

    it "should validate valid address" do
      @subscriber.should_not_receive('errors')

      @validator.validate_each(@subscriber, "email", "test@test.com")
    end

    it "should validate invalid address" do
      @subscriber.errors[].should_receive('<<')
      @validator.validate_each(@subscriber, "email", "notvalid")
    end
  end

  describe "validations" do
      before :each do
        NewsletterSubscriber.create( email: "augusto@insignia4u.com")
      end

      it {pending; should validate_presence_of(:email) }
      it {pending; should validate_uniqueness_of(:email) }
  end

  describe "add_to_mail_chimp_list callback" do
    before :each do
      @email  = Faker::Internet.email
      @hash   = { id: MAIL_CHIMP[:list_id], email_address: @email }
      @gibbon = mock(Gibbon)

      @gibbon.stub(:list_subscribe).with(@hash).and_return(true)
      Gibbon.stub(:new).and_return(@gibbon)

      @newsletter_subscriber = FactoryGirl.build(:newsletter_subscriber, email: @email)
    end

    it "should create new instance of Gibbon" do
      Gibbon.should_receive(:new).and_return(@gibbon)

      @newsletter_subscriber.save
    end

    it "should add new user to list" do
      @gibbon.should_receive(:list_subscribe).with(@hash)

      @newsletter_subscriber.save
    end

    context "succesfull API invoke" do
      before :each do
        @newsletter_subscriber.stub(:update_attribute).with(:on_mail_chimp_list, true).and_return(true)
        @regex = /.*#{Regexp.quote(@email)}.*#{Regexp.quote(MAIL_CHIMP[:list_name])}.*/
        Rails.stub_chain(:logger, :info).with(@regex).and_return(true)
      end

      it "should update the on_mail_chimp_list column" do
        @newsletter_subscriber.should_receive(:update_attribute).with(:on_mail_chimp_list, true).and_return(true)

        @newsletter_subscriber.save
      end

      it "should log the email add and the list" do
        Rails.logger.should_receive(:info).with(@regex).and_return(true)
        @newsletter_subscriber.save
      end
    end

    context "failure API invoke" do
      before :each do
        @message               = "Example message"
        @fake_error            = {"error" => @message}
        @gibbon.stub(:list_subscribe).and_return(@fake_error)

        Rails.stub_chain(:logger, :info).with("Mail chimp #error").and_return(true)
        Rails.stub_chain(:logger, :info).with(@message).and_return(true)
      end

      it "should log the failured api invoke" do
        Rails.logger.should_receive(:info).with("Mail chimp #error").and_return(true)
        Rails.logger.should_receive(:info).with(@message).and_return(true)
        @newsletter_subscriber.save
      end
    end
  end

  describe "retry_mail_chimp_subscription" do
    before :each do
      @email  = Faker::Internet.email
      @newsletter_subscriber = FactoryGirl.build(:newsletter_subscriber, email: @email)
      @newsletter_subscriber.stub(:add_mail_to_mail_chimp_list).with(@email).and_return(true)
    end

    it "should invoke to add_mail_to_mail_chimp_list" do
      @newsletter_subscriber.should_receive(:add_mail_to_mail_chimp_list)
        .with(@newsletter_subscriber.email).and_return(true)

      @newsletter_subscriber.retry_mail_chimp_subscription
    end
  end
end
