class AlterTrainingField < ActiveRecord::Migration
  def up
  	change_column :trainings, :days, :text, array: true
  end

  def down
  	change_column :trainings, :days, :string
  end
end
