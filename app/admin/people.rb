ActiveAdmin.register Person do
  filter :site

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Basic Information" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :title_id, :label => "Title",
              :as => :select, :collection => Hash[Title.all.map{|s| [s.name, s.id]}]
      f.input :first_name
      f.input :last_name
      f.input :bio
      f.input :photo, :as => :file
    end

    f.buttons
  end

  show do
    attributes_table do
      row "Site" do
        person.site.name
      end
      row "Title" do
        person.title.name
      end
      row :first_name
      row :last_name
      row :bio

      row :photo do
        image_tag(person.photo.url)
      end
    end
  end

  index do
    column ("Site") { |person| person.site.name }
    column ("Title"){ |person| person.title.name }
    column :first_name
    column :last_name
    column ("Bio")   { |person| truncate(person.bio.gsub(/<.*?>/,''), :length => 84) }

    default_actions
  end

end
