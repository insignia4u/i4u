class RemoveTitleModel < ActiveRecord::Migration
   def up
    remove_column :people, :title_id

    drop_table :titles
    rename_column :people, :title_name, :title
  end

  def down
    add_column :people, :title_id, :integer

    create_table :titles do |t|
      t.string :name
      t.timestamps
    end
    rename_column :people, :title, :title_name
  end
end
