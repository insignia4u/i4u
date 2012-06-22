class CreateTextSnippets < ActiveRecord::Migration
  def change
    create_table :text_snippets do |t|
      t.belongs_to :site
      t.string :name
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
    add_index :text_snippets, :site_id
    add_index :text_snippets, :slug, unique: true
  end
end
