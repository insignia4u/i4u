require 'spec_helper'

describe JobsController do

  describe "GET #new" do
    it "assigns a new Message to @message" do
      get :new

      assigns(:message).should be_a_new(Message)
      assigns(:message).is_to_job.should be_true
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    before :each do
      @message = mock_model(Message, :with_file= => nil, :valid? => true)

      Message.stub!(:new).and_return(@message)
      @notifier = mock('notifier', :deliver => nil)
      Notifier.stub!(:contact_message).and_return(@notifier)
    end

    context "with valid attributes" do
      it "creates a new message" do
        Message.should_receive(:new).and_return(@message)
        post :create, message: valid_attributes
      end

      it "assigns message variable" do
        post :create, message: valid_attributes
        assigns(:message).should eq @message
      end

      it "redirects to the new contact" do
        post :create, message: valid_attributes

        response.should redirect_to new_contact_path
      end
    end

    context "with invalid attributes" do
      before :each do
        @message = mock_model(Message, :with_file= => nil, :valid? => false)
        Message.stub!(:new).and_return(@message)
      end

      it "re-renders the new template" do
        post :create, message: invalid_attributes
        response.should render_template :new
      end
    end
  end
end

def valid_attributes
  @file ||= FactoryGirl::AttachmentHelper.uploaded_file
  {
    "body"  =>      "Some body name",
    "email" =>     "augusto@insignia4u.com",
    "file"  =>      @file,
    "name"  =>      "Augusto Pedraza"
  }
end

def invalid_attributes
  {
    "body"  =>      "",
    "email" =>     "invalid email...",
    "file"  =>      nil,
    "name"  =>      ""
  }
end