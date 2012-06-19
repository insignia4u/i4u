module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin_user]
      @user = FactoryGirl.create(:admin_user)
      sign_in @user
    end
  end
end
