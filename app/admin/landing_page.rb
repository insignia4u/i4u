ActiveAdmin.register LandingPage do
  menu parent: "Marketing", priority: 1
  filter :title

  index do
    column :path do |landing_page|
      link_to landing_page.path, landing_page.path
    end
    column :title
    column :heading
    actions
  end

  show title: :path do
    attributes_table do
      row :path do
        link_to landing_page.path, landing_page.path
      end
      row :title
      row :heading
      row :description
    end
    panel 'Items' do
      table_for landing_page.landing_page_items.by_position do
        column :title
        column :description do |lpi|
          textilize(lpi.description)
        end
      end
    end

  end

  form do |f|
    f.inputs "URL information" do
      f.input :folder, required: true
      f.input :slug, required: true
    end
    f.inputs "Metadata" do
      f.input :title, required: true, hint: "HTML title for the page"
    end
    f.inputs "Hero section" do
      f.input :heading, required: true
      f.input :description, required: true, input_html: {rows: 4}
    end
    f.inputs "Features" do
      f.has_many :landing_page_items, heading: 'Items', allow_destroy: true, sortable: :position do |t|
        t.input :title, required: true
        t.input :description, required: true, input_html: {rows: 4}, hint: 'You can use textile format to add html to this content.'
      end
    end
    actions
  end

  controller do
    def resource_params
      return [] if request.get?
      [
        params.require(:landing_page)
        .permit(:folder, :slug, :title, :heading, :description, landing_page_items_attributes: [:id, :"_destroy", :title, :description, :position])
      ]
    end
  end

end
