ActiveAdmin.register Training do
    menu parent: "Marketing", label: "Training Pages"
    filter :title

    permit_params :title, :subtitle, :summary, :price,
                  :discount, :initial_date, :days_time,
                  :topics, :addressed_to, :trainer_id, :calendar, :payment, :disable_payment,
                  :addressed_to_title, :requirements_title, :requirements, :short_url

    index do
        column ("Title"), sortable: :author do |training|
            training.title
        end
        column ("Subtitle") { |training| training.subtitle }
        column ("Summary") { |training| training.summary }
        column ("Price") { |training| training.price }
        column ("Discount") { |training| training.discount }
        column ("Start Day") { |training| training.initial_date }
        column ("Days") { |training| training.days_time }
        column ("Trainer") { |training| training.trainer.name }
        column ("Short URL") { |training| training.short_url }
        actions do |training|
            link_to "Preview", training_path(training), target:"_blank"
        end
    end

    show do
        attributes_table do
            row :title
            row :subtitle
            row :summary do |training|
                textilize(training.summary)
            end
            row :price
            row :discount
            row :initial_date
            row :days_time
            row :topics do |training|
                textilize(training.topics)
            end
            row :addressed_to_title
            row :addressed_to do |training|
                textilize(training.addressed_to)
            end
            row :requirements_title
            row :requirements do |training|
                textilize(training.requirements)
            end
            row "Trainer" do |training|
                training.trainer.name
            end
            row "Payment Link" do |training|
                training.payment
            end
            row :disable_payment
            row :short_url
            row "Link" do |training|
                link_to "#{training_url(training)}", training_path(training), target: "_blank"
            end
        end
    end

    form do |f|
        f.inputs "Edit Training" do
            f.input :title, label: "Title"
            f.input :short_url, hint: "Optional. Set a site-wide short url for this training."
            f.input :subtitle, label: "Subtitle"
            f.input :summary, label: "Summary"
            f.input :trainer_id, label: "Trainer", :as => :select, :collection => Hash[Trainer.all.map{|s| [s.name, s.id]}]
            f.input :price, label: "Price"
            f.input :discount, label: "Discount"
            f.input :initial_date, label: "Start Day"
            f.input :days_time, label: "Days", hint: "Example: Lunes y Viernes, 18hs a 20hs"
            f.input :topics, label: "Topics"
            f.input :addressed_to_title, label: "Addressed to Title"
            f.input :addressed_to, label: "Addressed to"
            f.input :requirements_title, label: "Requirements Title"
            f.input :requirements, label: "Requirements"
            f.input :calendar, label: "Calendar", hint: "Example: {{calendar 2015-12-12 2015-12-13}}"
            f.input :payment, label: "Payment link", hint:"Add payment link"
            f.input :disable_payment
        end
        actions
    end

end
