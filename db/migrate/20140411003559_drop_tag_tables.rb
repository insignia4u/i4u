class DropTagTables < ActiveRecord::Migration
  def up
    drop_table :taggings
    drop_table :tags
  end
end
