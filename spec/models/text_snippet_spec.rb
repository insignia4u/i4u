require 'spec_helper'

describe TextSnippet do
  describe "Attributes accessibility" do
    it { should respond_to(:name) }
    it { should respond_to(:title) }
    it { should respond_to(:body) }
    it { should respond_to(:site_id) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }

  end

  describe "instance methods" do
    let(:text_snippet) { FactoryGirl.create(:text_snippet) }
    subject { text_snippet }

    it "gets a summary of body" do
      subject.summary.length.should <= 140
    end
  end
end
