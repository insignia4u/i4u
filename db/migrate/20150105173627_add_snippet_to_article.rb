class AddSnippetToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :snippet, :text
  end
end
