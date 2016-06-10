ActiveAdmin.register ProjectImage do
  belongs_to :project

  filter :description

  index do
    column :description
    column :created_at

    column '' do |project_image|
      clippy(project_image.image).html_safe
    end

    column 'Url' do |project_image|
      image_tag project_image.image, size: '50x50'
    end
    actions
  end

  show do
    attributes_table do
      row :description
      row :created_at
      row :image do
        image_tag(project_image.image)
      end

      row 'Copy to clipboard' do
        clippy(project_image.image).html_safe
      end
    end
  end

  form do |f|
    f.inputs "Uploading file" do
      f.input :image, label: 'File to upload', hint: (f.object.new_record? ? "" : f.object.image.url), as: :file
      f.input :description
    end

    actions
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:project_image)
        .permit(:image, :description) ]
    end
  end
end
