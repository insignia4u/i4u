require 'spec_helper'

describe AdminUser do
   describe "Schema" do
    context "AdminUser Account Information" do
      it {
        should respond_to(:email)
        should respond_to(:password)
        should respond_to(:password_confirmation)
      }
    end

    context "Password Structure" do
      it { should respond_to(:encrypted_password) }
      it { should respond_to(:reset_password_token) }
    end

    context "Audit Trail" do
      it { should respond_to(:remember_created_at) }
      it { should respond_to(:sign_in_count) }
      it { should respond_to(:current_sign_in_at) }
      it { should respond_to(:last_sign_in_at) }
      it { should respond_to(:current_sign_in_ip) }
      it { should respond_to(:last_sign_in_ip) }
    end
  end

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
