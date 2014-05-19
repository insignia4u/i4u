require "spec_helper"

describe ErrorsDecorator do
  before(:each) do
    @full_messages = [ "Name can't be blank" ]
    @errors        = double('Errors Object', full_messages: @full_messages)
    @resource      = double('Some Model', new_record?: true, errors: @errors)

    @result        = ErrorsDecorator.new(@resource).to_html
  end

  describe "message box wrapper" do
    it "encloses error messsages within a div" do
      @result.should match /div.*"formErrors"/
    end
  end

  describe "message box title" do
    context "with a new record" do
      it "informs that create action failed" do
        @result.should match /h5.There was a problem creating the .*h5/
      end
    end

    context "with an existing record" do
      before(:each) do
        @resource.stub(:new_record?).and_return(false)
        @result = ErrorsDecorator.new(@resource).to_html
      end

      it "informs that update action failed" do
        @result.should match /h5.There was a problem updating the .*h5/
      end
    end
  end

  describe "messages list" do
    it "lists full error messages provided by resource" do
      @result.should match /li.Name can.*t be blank.*li/
    end
  end
end
