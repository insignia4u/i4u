require 'spec_helper'

describe Tool do
  describe "Attributes accessibility" do
    it { should respond_to(:title) }
    it { should respond_to(:description) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
