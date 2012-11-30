class AdminUser < ActiveRecord::Base

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  validates :password_confirmation, presence: true

  attr_accessible :email, :password, :password_confirmation, :remember_me

end
