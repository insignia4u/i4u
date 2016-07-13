class AddShortUrlToTraining < ActiveRecord::Migration
  def change
    add_column :trainings, :short_url, :string
    add_index :trainings, [:short_url]
  end
end
