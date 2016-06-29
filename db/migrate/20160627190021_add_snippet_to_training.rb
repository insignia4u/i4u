class AddSnippetToTraining < ActiveRecord::Migration
  def change
  	add_column	:trainings, :snippet, :string
  end
end
