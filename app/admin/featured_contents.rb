ActiveAdmin.register FeaturedContent do
  filter :site
  filter :name


  index do
    column ("Image") { |featured_content| image_tag(featured_content.image.url(:cms_thumb)) }
    column ("Site") { |featured_content| featured_content.site.name}
    column ("Name"), sortable: :name do |featured_content|
      featured_content.name 
    end
    column ("Updated At"), sortable: :updated_at do |featured_content|
      featured_content.updated_at
    end

    default_actions
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
end
