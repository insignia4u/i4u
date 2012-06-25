class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :site
      t.string :title
      t.text :summary

      t.timestamps
    end
    add_index :services, :site_id
  end
end
