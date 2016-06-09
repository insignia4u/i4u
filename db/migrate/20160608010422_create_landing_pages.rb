class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.string :folder
      t.string :slug
      t.string :title
      t.string :heading
      t.text :description

      t.timestamps
    end
  end
end
