require 'spec_helper'

describe Value do
  describe "Associations" do
    it { should belong_to(:site) }
  end
  describe "Attributes accesibility" do
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:subtitle) }
    it { should respond_to(:image) }
    it { should respond_to(:site) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:site) }
    it { should validate_uniqueness_of(:title) }
  end

end
