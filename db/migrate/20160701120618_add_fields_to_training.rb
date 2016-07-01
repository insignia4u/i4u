class AddFieldsToTraining < ActiveRecord::Migration
  def change
    add_column  :trainings, :addressed_to_title, :string
    add_column  :trainings, :requirements_title, :string
    add_column  :trainings, :requirements, :text
  end
end
