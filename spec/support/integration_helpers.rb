module IntegrationHelpers
  def create_default_site
    Site.create!(name: "English", abbreviation: "EN")
  end

  def current_site
    @current_site ||= Site.last
  end

  def create_published_article(current_site, date)
    create(
      :article, site: current_site,
      publication_date: date, publication_state: 1
    )
  end
end

