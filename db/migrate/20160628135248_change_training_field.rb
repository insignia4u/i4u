class ChangeTrainingField < ActiveRecord::Migration
  def up
    remove_column :trainings, :snippet
    add_column	  :trainings, :payment, :string
    add_column    :trainings, :disable_payment, :boolean, :default => false
  end

  def down
    add_column  :trainings, :snippet, :string
    remove_column :trainings, :payment
    remove_column :trainings, :disable_payment
  end
end
