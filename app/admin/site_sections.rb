ActiveAdmin.register SiteSection do
  menu false

  belongs_to :site

  filter :name

  index do
    column :name
    column :url
    default_actions
  end

  show do |site_section|
    attributes_table do
      row :name
      row :url
    end
  end

  form do |f|
    f.inputs "Section Information" do
      f.input :name
      f.input :url
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:site_section)
        .permit(:name, :url) ]
    end
  end
end
