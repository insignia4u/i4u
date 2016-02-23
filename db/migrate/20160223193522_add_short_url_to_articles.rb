class AddShortUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :short_url, :string
    add_index :articles, [:short_url]
  end
end
