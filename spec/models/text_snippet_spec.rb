require 'spec_helper'

describe TextSnippet do
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
