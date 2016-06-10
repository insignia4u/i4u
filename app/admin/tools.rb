ActiveAdmin.register Tool do
  menu parent: "Projects"

  config.sort_order = 'position_asc'

  filter :title
  filter :description

  index do
    column :title
    column :description
    actions
  end

  show do |site|
    attributes_table do
      row :title
      row :description
    end
  end

  form do |f|
    f.inputs("Edit Tool") do
      f.input :title
      f.input :description
    end
    f.buttons
  end

  action_item :only => :index do
    link_to('Reorder', "#", data: { sort_url: sort_admin_tools_url }, 
      id: "button-reorder-tools", class: "hide") unless Tool.all.empty?
  end

  collection_action :sort, :method => :post do
    params[:tool].each_with_index do |id, index|
      tool = Tool.find(id)
      tool.update_attribute(:position, index.to_i+1)
    end
    head 200
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:tool)
        .permit(:title, :description, :position) ]
    end
  end
end
