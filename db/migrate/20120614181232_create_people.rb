class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.belongs_to :site
      t.belongs_to :title
      t.string :first_name
      t.string :last_name
      t.text :bio

      t.timestamps
    end
    add_index :people, :site_id
    add_index :people, :title_id
  end
end
