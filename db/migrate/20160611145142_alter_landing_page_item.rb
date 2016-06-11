class AlterLandingPageItem < ActiveRecord::Migration

  def up
    remove_column :landing_page_items, :title
    remove_column :landing_page_items, :description
    add_column    :landing_page_items, :landing_page_content_id, :integer
    add_index     :landing_page_items, [:landing_page_id, :landing_page_content_id], name: 'landing_page_items_main_idx'
    add_index     :landing_pages, [:folder, :slug]
  end

  def down
    remove_index  :landing_page_items, [:landing_page_content_id]
    remove_column :landing_page_items, :landing_page_content_id
    remove_index  :landing_pages, [:folder, :slug]
    add_column    :landing_page_items, :title, :string
    add_column    :landing_page_items, :description, :text
  end

end
