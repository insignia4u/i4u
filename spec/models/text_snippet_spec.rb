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
    it { should validate_presence_of(:body) }
  end
end
