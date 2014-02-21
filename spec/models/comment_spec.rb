require 'spec_helper'

describe Comment do
  describe "Validations" do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:article) }
  end
end
