ActiveAdmin.register LandingPage do
  menu parent: "Marketing"
  filter :site

  index do
    column :path
    column :title
    column :heading
    default_actions
  end

  show do
    attributes_table do
      row :path
      row :title
      row :heading
      row :description
    end
  end

  form do |f|
    f.inputs "URL information" do
      f.input :folder, required: true
      f.input :slug, required: true
    end
    f.inputs "Metadata" do
      f.input :title, required: true, hint: "Html title for the page"
    end
    f.inputs "Hero section" do
      f.input :heading, required: true
      f.input :description, required: true, input_html: {rows: 4}
    end
    f.inputs "Features" do
      f.has_many :landing_page_items, sortable: :position do |t|
        t.input :title, required: true
        t.input :description, required: true, input_html: {rows: 4}
      end
    end
    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [
        params.require(:landing_page)
        .permit(:folder, :slug, :title, :heading, :description, landing_page_items_attributes: [:title, :description, :position])
      ]
    end
  end

end
