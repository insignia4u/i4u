ActiveAdmin.register TextSnippet do
  menu parent: "Support"

  filter :site
  filter :name
  filter :title
  filter :body

  index do
    column(:site) {|text_snippet| text_snippet.site.abbreviation}
    column :name, sortable: :name
    column :title, sortable: :title
    column(:summary, sortable: false) #{|text_snippet| textilize(text_snippet.summary)}
    column(:image) do |text_snippet|
      image_tag(text_snippet.image.url(:thumb)) if text_snippet.image?
    end

    actions
  end

  show do |text_snippet|
    attributes_table do
      row "Site" do
        text_snippet.site.name
      end
      row :name
      row :title
      row("body"){ raw RedCloth.new(text_snippet.body).to_html }
      row :image do
        image_tag(text_snippet.image.url(:thumb)) if text_snippet.image?
      end
    end
  end

  form do |f|
    f.inputs "Text Snippet Information" do
      f.input :site_id, :label => "Site", :as => :select,
        :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :name
      f.input :title
      f.input :body
      f.input :image, :as => :file
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:text_snippet)
        .permit(:body, :name, :title, :site_id, :image) ]
    end
  end

end
