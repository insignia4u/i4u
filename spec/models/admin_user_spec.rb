require 'spec_helper'

describe AdminUser do
  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "Factory Definition" do
    it "creates a valid AdminUser" do
      expect{ create(:admin_user) }.to change{ AdminUser.count }.by(1)
    end
  end
end
