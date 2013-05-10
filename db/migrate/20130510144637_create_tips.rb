class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string      :title
      t.integer     :type
      t.text        :description
      t.text        :content
      t.attachment  :image
      t.string      :slug

      t.timestamps
    end
    add_index :tips, :slug, unique: true
  end
end
