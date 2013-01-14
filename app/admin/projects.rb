ActiveAdmin.register Project do
  menu parent: "Portfolio"

  filter :site
  filter :name

  member_action :highlight, method: :put do
    project = Project.find(params[:id])
    message = project.highlight!? {notice: "This project is highlight!"} :
      {alert: project.errors.full_messages}
    redirect_to admin_project_path(project), message
  end

  member_action :unhighlight, method: :put do
    project = Project.find(params[:id])
    project.unhighlight!
    redirect_to admin_project_path(project), notice: "This project is not highlight anymore!"
  end

  action_item only: :show do
    link_to('Highlight this Project', highlight_admin_project_path(project), method: :put) unless project.highlighted?
  end

  action_item only: :show do
    link_to('Unhighlight this Project', unhighlight_admin_project_path(project), method: :put) if project.highlighted?
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Basic Information" do
      f.input :site_id, :label => "Site",
              :as => :select, :collection => Hash[Site.all.map{|s| [s.name, s.id]}]
      f.input :name
      f.input :url
      f.input :summary
      f.input :description
      f.input :image , hint: "Mostrada en la seccion de ultimos trabajos. (Tamanio requerido 277px x 250px)", input_html:
      {
        'url-data'  => (project.image? ?  project.image.url(:cms_thumb) : ''),
        'size-data' => "130x118",
        accept:              "image/*"
      }
    end

    f.inputs "Detailed Information" do
      f.input :extended_description
      f.input :started_at
      f.input :ended_at
      f.input :featured_image, hint: "Mostrada en la seccion de projectos destacados. (Tamanio requerido 940px x 555px)", input_html:
      {
        'url-data'  => (project.featured_image? ?  project.featured_image.url(:cms_thumb) : ''),
        'size-data' => "169x100",
        accept:              "image/*"
      }
    end
    f.inputs "Tags" do
      f.input :technologies, :as => :check_boxes
      f.input :tools, :as => :check_boxes
    end

    f.buttons
  end

  show do
    attributes_table do
      row "Site" do
        project.site.name
      end

      row :name
      row :url
      row :summary
      row(:description) {|project| textilize(project.description)}
      row(:extended_description) {|project| textilize(project.extended_description)}
      row :started_at
      row :ended_at

      row :image do
        image_tag(project.image.url(:cms_thumb))
      end
      row :featured_image do
        image_tag(project.featured_image.url(:cms_thumb))
      end

      row "Technologies" do
        project.technologies.map(&:name).join(",")
      end

      row "Tools" do
        project.tools.map(&:name).join(",")
      end

      row "Highlighted" do
        project.highlighted ? 'Yes' : 'No'
      end
    end
  end

  index do
    column ("Site") { |project| project.site.name }
    column :name
    column :url
    column ("Summary")   { |project| truncate(project.summary.gsub(/<.*?>/,''), :length => 84) }
    column ("Highlight") { |project| status_tag(project.highlight_state, :class => 'red') }
    column :started_at
    column :ended_at

    column "Technologies" do |project|
      project.technologies.each do |technology|
        status_tag(technology.name, :class => 'green')
      end
    end

    column "Tools" do |project|
      project.tools.each do |tool|
        status_tag(tool.name, :class => 'orange')
      end
    end

    default_actions
  end

end
