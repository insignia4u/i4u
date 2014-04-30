class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :title, unique:true
      t.string :subtitle
      t.text :description
      t.belongs_to :site

      t.timestamps
    end
    add_attachment :values, :image
  end
end
