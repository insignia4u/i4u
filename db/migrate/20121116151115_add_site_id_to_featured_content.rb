class AddSiteIdToFeaturedContent < ActiveRecord::Migration
  def self.up
    add_column :featured_contents, :site_id, :integer
  end

  def self.down
    remove_column :featured_contents, :site_id
  end
end
