class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.belongs_to :site

      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
