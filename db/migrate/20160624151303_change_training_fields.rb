class ChangeTrainingFields < ActiveRecord::Migration
  def up
  	remove_column 	:trainings, :days
  	remove_column 	:trainings, :time
  	remove_column 	:trainings, :number_of_classes
  	add_column		:trainings, :days_time, :string
  	add_column		:trainings, :calendar, :string
  end

  def down
  	add_column 		:trainings, :days, :string
  	add_column 		:trainings, :time, :string
  	add_column 		:trainings, :number_of_classes, :integer
  	remove_column	:trainings, :days_time
  	remove_column	:trainings, :calendar
  end
end
