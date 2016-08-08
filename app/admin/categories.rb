ActiveAdmin.register Category do
  menu parent: "Blog"
  filter :site

  permit_params :site_id,:name

  index do
    column ("Site") { |category| category.site.name }
    column ("Name"), sortable: :name do |category|
      category.name
    end
    actions
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

    actions
  end

end
