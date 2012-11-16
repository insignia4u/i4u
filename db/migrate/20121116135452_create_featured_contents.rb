class CreateFeaturedContents < ActiveRecord::Migration
  def change
    create_table :featured_contents do |t|
      t.string     :name,                :null => false
      t.text       :body,                :null => false
      t.attachment :image
      t.belongs_to :site

      t.timestamps
    end
  end
end
