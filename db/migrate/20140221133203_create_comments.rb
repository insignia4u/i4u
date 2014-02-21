class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :website
      t.text :text
      t.belongs_to :comments, index:true
      t.belongs_to :article, index:true

      t.timestamps
    end
  end
end
