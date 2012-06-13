class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :site_id
      t.string :name
      t.text :summary
      t.text :description
      t.text :extended_description
      t.string :url
      t.date :started_at
      t.date :ended_at
      t.boolean :highlighted, :default => false

      t.timestamps
    end
  end
end
