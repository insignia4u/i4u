class ServicesController < InheritedResources::Base

  def index
    @services_snippet = [
      { snippet: 'planificacion', icon_type: 'list-ol' },
      { snippet: 'codificacion', icon_type: 'tech'},
      { snippet: 'revision', icon_type: 'eye-open'},
      { snippet: 'control', icon_type: 'qa'},
      { snippet: 'produccion', icon_type: 'deploy'},
      { snippet: 'mantenimiento', icon_type: 'wrench'}
    ]
  end

  protected
    def begin_of_association_chain
      current_site
    end
end
