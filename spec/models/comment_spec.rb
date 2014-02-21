require 'spec_helper'

describe Comment do
  describe "Validations" do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:article) }
  end

  describe "methods" do
    it "return anonymous text if it haven't a name" do
      comment = Comment.new
      comment.get_name_or_anony.should be_eql("Anonymous")
    end
  end
end
