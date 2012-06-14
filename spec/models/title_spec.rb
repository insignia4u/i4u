require 'spec_helper'

describe Title do
  describe "attributes accessibility" do
    it { should     have_accessible(:name) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
