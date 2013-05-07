class CreateProjectImages < ActiveRecord::Migration
  def change
    create_table :project_images do |t|
      t.attachment :image
      t.text       :description
      t.belongs_to :project

      t.timestamps
    end
    add_index :project_images, :project_id
  end
end
