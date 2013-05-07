ActiveAdmin.register AttachmentFile, :as => "Assets" do
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
      attachment_file.file_i4u.url
    end
    default_actions
  end

  form do |f|
    f.inputs "Uploading file" do
      f.input :file_i4u, label: 'File to upload', hint: (f.object.new_record? ? "" : f.object.file_i4u.url), as: :file
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
        attachment_file.file_i4u.url
      end

      row 'Copy to clipboard' do |attachment_file|
        clippy(attachment_file.file_i4u).html_safe
      end
    end
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:attachment_file)
        .permit(:file_i4u, :summary, :name) ]
    end
  end

end
