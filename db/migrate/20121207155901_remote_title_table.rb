class RemoteTitleTable < ActiveRecord::Migration
  def up
    remove_index  :people, name: :index_people_on_title_id
    remove_column :people, :title_id

    drop_table :titles
  end

  def down
    add_column :people, :title_id, :integer
    add_index  :people, :title_id

    create_table :titles do |t|
      t.string :name

      t.timestamps
    end
  end
end
