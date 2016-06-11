ActiveAdmin.register LandingPageContent do
  menu parent: "Marketing", priority: 5
  filter :name

  index do
    column :name
    column :title
    column :description
    actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :title
      row :description
    end
  end

  form do |f|
    f.inputs "Landing Page Content Details" do
      f.input :name, required: true
      f.input :title, required: true
      f.input :description, required: true, input_html: {rows: 4}
    end
    actions
  end

  controller do
    def resource_params
      return [] if request.get?
      [
        params.require(:landing_page_content).permit(:name, :title, :description)
      ]
    end
  end

end
