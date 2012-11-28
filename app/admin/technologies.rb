ActiveAdmin.register Technology do
  menu parent: "Support"

  config.sort_order = 'position_asc'
  filter :name

  index do
    column :name
    default_actions
  end

  show do |site|
    attributes_table do
      row :name
    end
  end

  action_item :only => :index do
    link_to('Reorder', "#", data: { sort_url: sort_admin_technologies_url }, 
      id: "button-reorder-technologies", class: "hide") unless Technology.all.empty?
  end

collection_action :sort, :method => :post do
    params[:technology].each_with_index do |id, index|
      technology = Technology.find(id)
      technology.update_attribute(:position, index.to_i+1)
    end
    head 200
  end
end
