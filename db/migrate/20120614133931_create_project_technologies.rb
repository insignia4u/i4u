class CreateProjectTechnologies < ActiveRecord::Migration
  def change
    create_table :project_technologies do |t|
      t.belongs_to :project
      t.belongs_to :technology

      t.timestamps
    end
    add_index :project_technologies, :project_id
    add_index :project_technologies, :technology_id
  end
end
