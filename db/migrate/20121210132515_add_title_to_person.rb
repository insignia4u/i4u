class AddTitleToPerson < ActiveRecord::Migration
  def up
    add_column :people, :title_name, :string

    Person.reset_column_information
    Person.all.each do |person|
      person.update_column(:title_name, Title.find(person.title_id).name)
    end
end

  def down
    remove_column :people, :title_name
  end
end
