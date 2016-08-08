ActiveAdmin.register SiteSection do
  menu false

  belongs_to :site

  filter :name

  permit_params :name, :url

  index do
    column :name
    column :url
    actions
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
    actions
  end

end
