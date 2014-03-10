class CreateTestimonies < ActiveRecord::Migration
  def change
    create_table :testimonies do |t|
      t.string :body
      t.string :video_id
      t.boolean :published, :default => false
      t.datetime :published_at

      t.timestamps
    end
  end
end
