ActiveAdmin.register Site do
  menu parent: "Support"

  filter :name

  scope :all, default: true
  scope :live
  scope :hidden

  member_action :live, method: :put do
    site = Site.find(params[:id])
    site.live!
    redirect_to admin_site_path(site), notice: "This site is live!"
  end

  member_action :hide, method: :put do
    site = Site.find(params[:id])
    site.hide!
    redirect_to admin_site_path(site), notice: "This site is not available anymore!"
  end

  action_item only: :show do
    link_to('Publish Live', live_admin_site_path(site), method: :put) unless site.available?
  end

  action_item only: :show do
    link_to('Hide this Site', hide_admin_site_path(site), method: :put) if site.available?
  end

  index do
    column :name
    column :abbreviation
    column ("Publication State")  {|site| status_tag(site.publication_state, :class => 'red') }
    actions
    column :actions do |site|
      link_to "Manage Sections", [:admin, site, :site_sections]
    end
  end

  show do |site|
    attributes_table do
      row :name
      row :abbreviation
      row :publication_state
    end
  end

  form do |f|
    f.inputs "Site Information" do
      f.input :name
      f.input :abbreviation
    end
    actions
  end

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:site)
        .permit(:name, :abbreviation) ]
    end
  end
end
