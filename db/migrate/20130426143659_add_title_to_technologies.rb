class AddTitleToTechnologies < ActiveRecord::Migration
  def change
    add_column :technologies, :description, :text
    rename_column :technologies, :name, :title
  end
end
