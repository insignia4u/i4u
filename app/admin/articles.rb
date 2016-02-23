ActiveAdmin.register Article do
  menu parent: "Blog"
  filter :site

  index do
    column ("Site") { |article| article.site.name }
    column ("Author"), sortable: :author do |article|
      article.author
    end
    column ("Title"), sortable: :title do |article|
      article.title
    end
    column ("Subtitle"), sortable: :subtitle do |article|
      article.subtitle
    end
    column 'Image' do |article|
      if article.image.present?
        image_tag article.image, size: '50x50'
      else
        ''
      end
    end
    column ("Summary"), sortable: :summary do |article|
      truncate article.summary, length: 100
    end
    column ("Publication State"), sortable: :publication_state do |article|
      check_state(article.publication_state)
    end
    column ("Publication date"), sortable: :publication_date do |article|
      article.publication_date
    end
    column ("Categories") do |article|
      article.categories.map {|cat| cat.name }.join(', ')
    end
    column("Event article") do |article|
      article.is_event ? 'Yes' : 'No'
    end

    default_actions
  end

  show do
    attributes_table do
      row "Site" do |article|
        article.site.name
      end
      row :categories do |article|
        article.categories.map {|cat| cat.name }.join(', ')
      end
      row :author
      row :short_url
      row :title
      row :subtitle
      row :description do |article|
        textilize(article.description)
      end
      row :image do |article|
        if article.image.present?
          image_tag article.image.url(:small)
        else
          ''
        end
      end
      row :summary
      row :content do |article|
        textilize(article.content)
      end
      row :snippet
      row :snippet_demo do |article|
        raw(article.snippet)
      end
      row :publication_state do |article|
        check_state(article.publication_state)
      end
      row :publication_date
      row :is_event do |article|
        article.is_event ? 'Yes' : 'No'
      end
    end
  end

  form do |f|
    f.inputs "Edit News" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :categories, as: :select
      f.input :author
      f.input :short_url, hint: "Optional. Set a site-wide short url for this article."
      f.input :title
      f.input :subtitle
      f.input :description, hint: "description its shown in home page"
      f.input :image, label: 'Hightligh Image',
        hint: (f.object.new_record? ? "" : f.object.image.url), as: :file
      f.input :image_caption, hint: "It is the images' caption"
      f.input :content, hint: "You can use textile format to write this - {{calendar aaaa-mm-dd}} - {{training classes hours weeks $price discount% }} | e.g. {{training 3 2 6 $1000 10%}}"
      f.input :summary, hint: "summary its show in blog with textile format"
      f.input :snippet, hint: "Add raw html here, this will be shown at the bottom of the article", :input_html => { :class => 'autogrow', :rows => 20, :cols => 30}
      f.input :publication_state, label: 'Publication state', as: :select,
        collection: [['Draft',0],['Published',1]]
      f.input :publication_date
      f.input :is_event
    end

    f.buttons
  end

  controller do
    def resource_params
      return [] if request.get?
      [
        params.require(:article)
        .permit(
          :site_id,:author, :title, :content,:subtitle,
          :summary, :publication_date, :publication_state,
          :image,:description, :image_caption, :is_event, :snippet, :short_url, 
          category_ids: []
        )
      ]
    end
  end

end
