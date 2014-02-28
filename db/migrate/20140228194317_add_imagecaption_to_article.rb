class AddImagecaptionToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :image_caption, :string
  end
end
