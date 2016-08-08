ActiveAdmin.register Testimony do

  permit_params :body, :video_id, :published

  index do
    column :body
    column :video_id
    column("Publication Status") { |testimony| testimony.published? ? 'Yes' : 'No' }
    actions
  end

  show do |site|
    attributes_table do
      row :body
      row :video_id
      row 'Publication Status' do |testimony|
        testimony.published? ? 'Yes' : 'No'
      end
    end
  end

  form do |f|
    f.inputs("Edit Tool") do
      f.input :body
      f.input :video_id
      f.input :published
    end
    actions
  end

end
