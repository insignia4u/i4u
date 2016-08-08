ActiveAdmin.register Value do
  filter :site

  permit_params :site_id, :title, :subtitle, :description, :image

  index do
    column ("Site") { |value| value.site_name }
    column ("Title"), sortable: :title do |value|
      value.title
    end
    column ("Subtitle"), sortable: :subtitle do |value|
      value.subtitle
    end
    column ("Image") do |value|
      if value.image.present?
        image_tag value.image, size: '50x50'
      else
        ''
      end
    end

    actions
  end

  form do |f|
    f.inputs "Edit Values" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :title
      f.input :subtitle
      f.input :description
      f.input :image, hint: ( (f.object.new_record?)? "" : f.object.image.url ),
              as: :file
    end
    actions
  end

end
