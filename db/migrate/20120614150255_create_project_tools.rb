class CreateProjectTools < ActiveRecord::Migration
  def change
    create_table :project_tools do |t|
      t.belongs_to :project
      t.belongs_to :tool

      t.timestamps
    end
    add_index :project_tools, :project_id
    add_index :project_tools, :tool_id
  end
end
