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
end
