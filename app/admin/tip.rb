ActiveAdmin.register Tip do

  filter :site

  index do
    column ("Site") { |article| article.site.name }
    column ("Title"), sortable: :title do |article|
      article.title
    end
    column ("description"), sortable: :description do |tip|
      tip.description
    end
    column 'Image' do |tip|
      if tip.image.present?
        image_tag tip.image, size: '50x50'
      else
        ''
      end
    end
    column ("Type"), sortable: :type do |tip|
      tip_type(tip)
    end
    column :published_at

    actions
  end

  show do
    attributes_table do
      row "Site" do |article|
        article.site.name
      end
      row :title
      row :link
      row :description do |tip|
        textilize(tip.description)
      end
      row :image do |tip|
        if tip.image.present?
          image_tag tip.image.url(:small)
        else
          ''
        end
      end
      row :tip_type do |tip|
        tip_type(tip)
      end
      row :content do |tip|
        textilize(tip.content)
      end
      row :published_at
      row :created_at
    end
  end

  form do |f|
    f.inputs "Edit News" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :title
      f.input :link
      f.input :tip_type, label: 'Type', as: :select,
        collection: [['Rails Tip',0],['Day Tip',1]]
      f.input :description
      f.input :image, label: 'Hightligh Image',
        hint: (f.object.new_record? ? "" : f.object.image.url), as: :file
      f.input :content
      f.input :published_at, :as => :date, :start_year => Date.today.year
    end

    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:tip)
        .permit(:site_id, :title, :link, :content, :image,
                :description, :tip_type, :published_at) ]
    end
  end

end
