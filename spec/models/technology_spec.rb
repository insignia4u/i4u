require 'spec_helper'

describe Technology do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
