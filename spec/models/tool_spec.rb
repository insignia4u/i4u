require 'spec_helper'

describe Tool do
  describe "Validations" do
    it { should validate_presence_of(:title) }
  end
end
