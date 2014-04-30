class AddLinkToTip < ActiveRecord::Migration
  def change
    add_column :tips, :link, :string
  end
end
