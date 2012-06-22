ActiveAdmin.register TextSnippet do
  menu parent: "Support"

  filter :name

  index do
    column :name
    column :title

    default_actions
  end

  show do |text_snippet|
    attributes_table do
      row :name
      row :title
      row("body"){ raw RedCloth.new(text_snippet.body).to_html }
    end
  end

  form do |f|
    f.inputs "Text Snippet Information" do
      f.input :site_id, :label => "Site", :as => :select,
        :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :name
      f.input :title
      f.input :body
    end
    f.buttons
  end
end
