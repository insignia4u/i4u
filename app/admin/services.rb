ActiveAdmin.register Service do
  menu parent: "Support"

  filter :title

  permit_params :site_id, :summary, :title, :image

  index do
    column :title
    column ("Summary") { |service| truncate(service.summary.gsub(/<.*?>/,''), :length => 84) }
    actions
  end

  show do |site|
    attributes_table do
      row :title
      row :summary
      row :image do
        image_tag(service.image.url(:cms_thumb))
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Detailed Information" do
      f.input :site_id, :label => "Site",
        :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :title
      f.input :summary
      f.input :image, :as => :file
    end

    actions
  end

end
