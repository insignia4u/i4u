ActiveAdmin.register FeaturedContent do
  form do |f|
    f.inputs "Edit Featured Content" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :name
      f.input :body, label: 'Description'
      f.input :image, :as => :file
    end

    f.buttons
  end

  show do
    attributes_table do
      row "Site" do
        featured_content.site.name
      end
      row :name
      row :body  do
        textilize(featured_content.body)
      end
      row :image do
        image_tag(featured_content.image.url(:cms_thumb))
      end
    end
  end
end
