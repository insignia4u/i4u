class FixCommentsIdFromComments < ActiveRecord::Migration
  def change
    rename_column :comments, :comments_id, :comment_id
  end
end
