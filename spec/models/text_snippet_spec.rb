require 'spec_helper'

describe TextSnippet do
  describe "Attributes accessibility" do
    it { should have_accessible(:name) }
    it { should have_accessible(:title) }
    it { should have_accessible(:body) }
    it { should have_accessible(:site_id) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }

  end

  describe "instance methods" do
    it "gets a summary of body" do
      create(:text_snippet).summary.length.should <= 140
    end
  end
end
