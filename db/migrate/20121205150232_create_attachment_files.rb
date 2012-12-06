class CreateAttachmentFiles < ActiveRecord::Migration
  def change
    create_table :attachment_files do |t|
      t.attachment :file_i4u
      t.text       :summary
      t.string     :slug
      t.string     :name

      t.timestamps
    end

    add_index :attachment_files, :slug, unique: true
  end
end