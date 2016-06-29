class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string      :name
      t.string      :title
      t.text        :profile
      t.attachment  :image
      t.string      :profile_url

      t.timestamps
    end
  end
end