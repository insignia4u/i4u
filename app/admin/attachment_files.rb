ActiveAdmin.register AttachmentFile do
  filter :name
  menu parent: 'Support'

  index do
    column :name
    column :summary
    column :created_at

    column '' do |attachment_file|
      clippy(attachment_file.file_i4u).html_safe
    end

    default_actions
  end

  form do |f|
    f.inputs "Uploading file" do
      f.input :file_i4u, label: 'File to upload', as: :file
      f.input :name
      f.input :summary
    end

    f.buttons
  end

  show do
    attributes_table do
      row :name
      row :summary
      row :created_at
    end
  end

end
