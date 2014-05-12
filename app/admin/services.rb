ActiveAdmin.register Service do
  menu parent: "Support"

  filter :title

  index do
    column :title
    column ("Summary") { |service| truncate(service.summary.gsub(/<.*?>/,''), :length => 84) }
    default_actions
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

    f.actions
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:service)
        .permit(:site_id, :summary, :title, :image) ]
    end
  end
end
