require 'spec_helper'

describe Tool do
  describe "Attributes accessibility" do
    it { should have_accessible(:name) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
