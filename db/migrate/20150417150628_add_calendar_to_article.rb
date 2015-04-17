class AddCalendarToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :calendar, :string
  end
end
