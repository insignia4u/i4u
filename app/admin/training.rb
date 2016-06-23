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
        column ("Days") { |training| training.days }
        column ("Schedule") { |training| training.time }
        column ("Number of classes") { |training| training.number_of_classes }
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
            row :days do |training|
                raw(training.days)
            end
            row :time
            row :number_of_classes
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
        f.semantic_errors *f.object.errors.keys

        f.inputs "Edit Training" do
            f.input :title, label: "Title"
            f.input :subtitle, label: "Subtitle"
            f.input :summary, label: "Summary"
            f.input :price, label: "Price"
            f.input :discount, label: "Discount"
            f.input :initial_date, label: "Start Day"
            f.input :days, as: :select, collection: ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"], multiple: true, label: "Days"
            f.input :time, label: "Schedule", hint: "Example: 18hs a 20hs"
            f.input :number_of_classes, label: "Number of classes"
            f.input :topics, label: "Topics"
            f.input :addressed_to, label: "Addressed to"
            f.input :trainer_id, label: "Trainer", :as => :select, :collection => Hash[Trainer.all.map{|s| [s.name, s.id]}]
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
              :discount, :initial_date, {:days => []}, :time, 
              :number_of_classes, :topics, :addressed_to, :trainer_id
            )
          ]
        end
    end
end
