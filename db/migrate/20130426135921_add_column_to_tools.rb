class AddColumnToTools < ActiveRecord::Migration
  def change
    add_column :tools, :description, :text
    rename_column :tools, :name, :title
  end
end
