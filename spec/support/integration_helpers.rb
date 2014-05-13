module IntegrationHelpers
  def create_default_site
    Site.create!(name: "English", abbreviation: "EN")
  end

  def current_site
    @current_site ||= Site.last
  end
end

