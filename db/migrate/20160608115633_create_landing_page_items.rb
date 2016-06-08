class CreateLandingPageItems < ActiveRecord::Migration
  def change
    create_table :landing_page_items do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.references :landing_page

      t.timestamps
    end
    add_index :landing_page_items, :landing_page_id
  end
end
