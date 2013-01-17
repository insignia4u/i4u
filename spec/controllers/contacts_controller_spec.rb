require 'spec_helper'

describe ContactsController do
  describe "Generate new instance" do
    describe "GET #new" do
      it "assigns a new Message to @message" do
        get :new

        assigns(:message).should be_a_new(Message)
      end

      it "renders the :new template" do
        get :new
        response.should render_template :new
      end
    end
  end

  describe "Build a message" do
    before :each do
      @message = mock_model(Message)
      @mailer  = mock(Notifier)

      Message.stub!(:new).and_return(@message)
      @message.stub!(:valid?)

      Notifier.stub!(:contact_message).and_return(@mailer)
      @mailer.stub!(:deliver)
    end

    it "responds with redirect with valid message" do
      Message.should_receive(:new).and_return(@message)
      @message.should_receive(:valid?).and_return(true)
      Notifier.should_receive(:contact_message).with(@message).and_return(@mailer)
      @mailer.should_receive(:deliver)
      post :create
      response.should be_redirect
    end

    it "responds with templete with invalid message" do
      Message.should_receive(:new).and_return(@message)
      @message.should_receive(:valid?).and_return(false)
      post :create
      response.should render_template("new")
    end
  end
end
