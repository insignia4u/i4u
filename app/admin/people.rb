ActiveAdmin.register Person do

  config.sort_order = 'position_asc'
  filter :site

  permit_params :site_id, :bio, :first_name, :last_name, :photo,
                :site, :title, :position

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Basic Information" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :title
      f.input :first_name
      f.input :last_name
      f.input :bio
      f.input :photo, :as => :file
    end

    actions
  end

  action_item :only => :index do
    link_to('Reorder', "#", data: { sort_url: sort_admin_people_url }, 
      id: "button-reorder-people", class: "hide") unless Person.all.empty?
  end

  show do
    attributes_table do
      row "Site" do
        person.site.name
      end

      row :title
      row :first_name
      row :last_name
      row :bio

      row :photo do
        image_tag(person.photo.url(:thumb))
      end
    end
  end

  index do
    column ("Site") { |person| person.site.name }
    column :title
    column :first_name
    column :last_name
    column ("Bio")   { |person| truncate(person.bio.gsub(/<.*?>/,''), :length => 84) }

    actions
  end

  collection_action :sort, :method => :post do
    params[:person].each_with_index do |id, index|
      person = Person.find(id)
      person.update_attribute(:position, index.to_i+1)
    end
    head 200
  end

end
