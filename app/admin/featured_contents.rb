ActiveAdmin.register FeaturedContent do
  filter :site
  filter :name


  index do
    column ("Image") { |featured_content| image_tag(featured_content.image.url(:cms_thumb)) }
    column ("Site")  { |featured_content| featured_content.site.name}
    column ("Name"), sortable: :name do |featured_content|
      featured_content.name 
    end
    column ("Updated At"), sortable: :updated_at do |featured_content|
      featured_content.updated_at
    end

    actions
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
      f.input :image , input_html:
      {
        'url-data'  => (featured_content.image? ?  featured_content.image.url(:cms_thumb) : ''),
        'size-data' => "130x118",
        accept:              "image/*"
      }
    end

    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:featured_content)
        .permit(:name, :body, :image, :site, :site_id) ]
    end
  end

end
