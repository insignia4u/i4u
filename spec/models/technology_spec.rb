require 'spec_helper'

describe Technology do
  describe "Validations" do
    it { should validate_presence_of(:title) }
  end
end
