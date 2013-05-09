ActiveAdmin.register Article do

  filter :site

  index do
    column ("Site") { |article| article.site.name }
    column ("Title"), sortable: :title do |article|
      article.title 
    end
    column ("Subtitle"), sortable: :subtitle do |article|
      article.subtitle
    end
    column ("Summary"), sortable: :summary do |article|
      article.summary
    end
    column ("Publication State"), sortable: :publication_state do |article|
      article.publication_state
    end
    column ("Updated At"), sortable: :updated_at do |article|
      article.updated_at
    end

    default_actions
  end

  show do
    attributes_table do
      row "Site" do |article|
        article.site.name
      end
      row :title
      row :subtitle
      row :summary
      row :content do |article|
        textilize(article.content)
      end
      row :publication_state
      row :publication_date
    end
  end

  form do |f|
    f.inputs "Edit News" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :title
      f.input :subtitle
      f.input :content
      f.input :summary
      f.input :publication_state, label: 'Publication state', as: :select,
        collection: [['Draft',false],['Published',true]]
      f.input :publication_date
    end

    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:article)
        .permit(:site_id,:title, :content,:subtitle, :content, :summary,
         :publication_date, :publication_state) ]
    end
  end

end
