class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string        :title,            null: false
      t.string        :subtitle
      t.text          :summary
      t.text          :content
      t.date          :publication_date
      t.integer       :publication_state, default: 0
      t.string        :slug
      t.belongs_to    :site

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
