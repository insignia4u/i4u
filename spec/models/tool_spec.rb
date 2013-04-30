require 'spec_helper'

describe Tool do
  describe "Attributes accessibility" do
    it { should have_accessible(:title) }
    it { should have_accessible(:description) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
