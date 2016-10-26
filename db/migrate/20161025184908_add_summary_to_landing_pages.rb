class AddSummaryToLandingPages < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_pages, :summary, :text
  end
end
