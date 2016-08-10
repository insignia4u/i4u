class AddPresaleToTrainings < ActiveRecord::Migration[5.0]
  def change
    add_column :trainings, :presale, :boolean
    add_column :trainings, :presale_title, :string
    add_column :trainings, :presale_price, :integer
    add_column :trainings, :presale_discount, :integer
    add_column :trainings, :presale_payment, :string
    add_column :trainings, :presale_expiration, :date
  end
end
