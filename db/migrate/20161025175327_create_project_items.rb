class CreateProjectItems < ActiveRecord::Migration[5.0]
  def change
    create_table :project_items do |t|
      t.string :title
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
