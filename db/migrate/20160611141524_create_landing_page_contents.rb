class CreateLandingPageContents < ActiveRecord::Migration
  def change
    create_table :landing_page_contents do |t|
      t.string :name
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
