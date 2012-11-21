class AddImageToTextSnippets < ActiveRecord::Migration
  def self.up
    add_attachment :text_snippets, :image
  end

  def self.down
    remove_attachment :text_snippets, :image
  end
end
