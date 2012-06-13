ActiveAdmin.register Technology do
  menu parent: "Support"

  filter :name

  index do
    column :name
    default_actions
  end

  show do |site|
    attributes_table do
      row :name
    end
  end
end
