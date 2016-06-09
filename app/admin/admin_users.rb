ActiveAdmin.register AdminUser do
  menu label: 'Admins'
  filter :email

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  show do
    attributes_table do
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end

  controller do

    def resource_params
      return [] if request.get?
      [ params.require(:admin_user)
        .permit(:email, :password, :password_confirmation, :remember_me) ]
    end
  end
end
