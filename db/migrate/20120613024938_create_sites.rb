class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string  :name
      t.string  :abbreviation
      t.boolean :live, default: false

      t.timestamps
    end
  end
end
