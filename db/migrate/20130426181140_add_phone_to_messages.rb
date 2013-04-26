class AddPhoneToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :phone, :string
  end
end
