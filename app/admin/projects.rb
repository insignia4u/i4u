ActiveAdmin.register Project do
  menu parent: "Portfolio"

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Basic Information" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :name
      f.input :url
      f.input :summary
      f.input :description
      f.input :image, :as => :file
    end
    f.inputs "Detailed Information" do
      f.input :extended_description
      f.input :started_at
      f.input :ended_at
      f.input :featured_image, :as => :file
    end
    f.inputs "Tags" do
      f.input :technologies, :as => :check_boxes
    end

    f.buttons
  end

  show do |offer_image|
    attributes_table do
      row "Site" do
        project.site.name
      end

      row :name
      row :url
      row :summary
      row :description
      row :extended_description
      row :started_at
      row :ended_at

      row :image do
        image_tag(project.image.url)
      end
      row :featured_image do
        image_tag(project.featured_image.url)
      end
    end
  end

  index do
    column ("Site") { |project| project.site.name }
    column :name
    column :url
    column ("Summary")   { |project| truncate(project.summary.gsub(/<.*?>/,''), :length => 84) }
    column ("Highlight") { |project| status_tag(project.highlight_state) }
    column :started_at
    column :ended_at

    default_actions
  end

end
