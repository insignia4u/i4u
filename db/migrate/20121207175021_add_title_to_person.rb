class AddTitleToPerson < ActiveRecord::Migration
  def change
    add_column :people, :title, :string
  end
end
