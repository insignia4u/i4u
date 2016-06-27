ActiveAdmin.register Training do
    menu parent: "Marketing"
    filter :title

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
        actions
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
            row :addressed_to do |training|
                textilize(training.addressed_to)
            end
            row "Trainer" do |training|
                training.trainer.name
            end
        end
    end

    form do |f|
        f.inputs "Edit Training" do
            f.input :title, label: "Title"
            f.input :subtitle, label: "Subtitle"
            f.input :summary, label: "Summary"
            f.input :trainer_id, label: "Trainer", :as => :select, :collection => Hash[Trainer.all.map{|s| [s.name, s.id]}]
            f.input :price, label: "Price"
            f.input :discount, label: "Discount"
            f.input :initial_date, label: "Start Day"
            f.input :days_time, label: "Days", hint: "Example: Lunes y Viernes, 18hs a 20hs"
            f.input :topics, label: "Topics"
            f.input :addressed_to, label: "Addressed to"
            f.input :calendar, label: "Calendar", hint: "Example: {{calendar 2015-12-12 2015-12-13}}"
        end
        actions
    end

    controller do
        def resource_params
          return [] if request.get?
          [
            params.require(:training)
            .permit(
              :title, :subtitle, :summary, :price,
              :discount, :initial_date, :days_time,
              :topics, :addressed_to, :trainer_id, :calendar
            )
          ]
        end
    end
end
