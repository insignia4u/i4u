ActiveAdmin.register Trainer do
    menu parent: "Marketing"
    filter :name

    index do
        column ("Name"), sortable: :name do |trainer|
          trainer.name
        end
        column ("Title"), sortable: :title do |trainer|
          trainer.title
        end
        column ("Image") do |trainer|
            if trainer.image.present?
                image_tag trainer.image, size: '50x50'
            else
                ''
            end
        end
        column ("Profile URL") {|trainer| trainer.profile_url}
        actions
    end

    show do
        attributes_table do
            row :name
            row :title
            row :profile
            row :image do |trainer|
                if trainer.image.present?
                    image_tag trainer.image.url(:small)
                else
                    ''
                end
            end
            row :profile_url
        end
    end

    form do |f|
        f.inputs "Edit Profile" do
            f.input :name, :label => "Name"
            f.input :title, :label => "Title"
            f.input :profile, :label => "Profile"
            f.input :image, label: "Image",
                hint: (f.object.new_record? ? "" : f.object.image.url), as: :file
            f.input :profile_url, hint: "LinkedIn Profile"
        end
        actions
    end

    controller do
        def resource_params
          return [] if request.get?
          [
            params.require(:trainer)
            .permit(
              :name,:title, :profile, :image, :profile_url
            )
          ]
        end
    end
end
