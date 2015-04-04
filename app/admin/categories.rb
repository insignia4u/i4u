ActiveAdmin.register Category do
  menu parent: "Blog"
  filter :site

  index do
    column ("Site") { |category| category.site.name }
    column ("Name"), sortable: :name do |category|
      category.name
    end
    default_actions
  end

  show do
    attributes_table do
      row "Site" do |article|
        article.site.name
      end
      row :name
    end
  end

  form do |f|
    f.inputs "Edit Category" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :name
    end

    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:category)
        .permit(:site_id,:name) ]
    end
  end

end
