class AddIsEventToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :is_event, :boolean, default: false
  end
end
