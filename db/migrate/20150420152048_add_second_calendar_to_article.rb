class AddSecondCalendarToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :second_calendar, :string
  end
end
