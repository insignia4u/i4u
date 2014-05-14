module StaticContent
  class Services
    def self.data
      [
        { snippet: 'planificacion', icon_type: 'list-ol' },
        { snippet: 'codificacion',  icon_type: 'tech'},
        { snippet: 'revision',      icon_type: 'eye-open'},
        { snippet: 'control',       icon_type: 'qa'},
        { snippet: 'produccion',    icon_type: 'deploy'},
        { snippet: 'mantenimiento', icon_type: 'wrench'}
      ]
    end
  end
end
