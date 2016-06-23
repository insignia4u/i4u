class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string      :title, null: false
      t.string      :subtitle
      t.text        :summary
      t.integer     :price
      t.integer     :discount
      t.date        :initial_date
      t.string      :days
      t.string      :time
      t.integer     :number_of_classes
      t.text        :topics
      t.text        :addressed_to
      t.string      :slug
      t.references  :trainer

      t.timestamps
    end
    add_index :trainings, :trainer_id
    add_index :trainings, :slug, unique: true
  end
end
