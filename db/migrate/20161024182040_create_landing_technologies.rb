class CreateLandingTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :landing_technologies do |t|
      t.belongs_to :landing_page, foreign_key: true
      t.belongs_to :technology, foreign_key: true

      t.timestamps
    end
  end
end
