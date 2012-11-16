class AddSlugToFeaturedContent < ActiveRecord::Migration
  def change
    add_column :featured_contents, :slug, :string
    add_index  :featured_contents, :slug, unique: true
  end
end
