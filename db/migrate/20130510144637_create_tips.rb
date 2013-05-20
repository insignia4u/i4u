class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string        :title
      t.integer       :tip_type
      t.text          :description
      t.text          :content
      t.attachment    :image
      t.datetime      :published_at
      t.string        :slug
      t.belongs_to    :site

      t.timestamps
    end
    add_index :tips, :slug, unique: true
  end
end
