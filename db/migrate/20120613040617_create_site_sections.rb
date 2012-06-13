class CreateSiteSections < ActiveRecord::Migration
  def change
    create_table :site_sections do |t|
      t.belongs_to :site
      t.string     :name
      t.string     :url
      t.string     :slug

      t.timestamps
    end

    add_index :site_sections, :site_id
    add_index :site_sections, :slug,   unique: true
  end
end
