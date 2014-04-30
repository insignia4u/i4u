class CreateTableArticleCategory < ActiveRecord::Migration
  def change
    create_table :articles_categories do |t|
      t.belongs_to :article
      t.belongs_to :category
    end
  end
end
