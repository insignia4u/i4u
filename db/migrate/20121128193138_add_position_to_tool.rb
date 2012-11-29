class AddPositionToTool < ActiveRecord::Migration
  def change
    add_column :tools, :position, :integer
  end
end
