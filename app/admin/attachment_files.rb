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

    column 'Url' do |attachment_file|
      link_to attachment_file.name, attachment_file.file_i4u.url, target: '_blank'
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
      row 'Url' do |attachment_file|
        link_to attachment_file.name, attachment_file.file_i4u.url, target: '_blank'
      end

      row 'Copy to clipboard' do |attachment_file|
        clippy(attachment_file.file_i4u).html_safe
      end
    end
  end

end
