class Site < ActiveRecord::Base

  has_many :site_sections
  has_many :projects
  has_many :people
  has_many :services
  has_many :text_snippets
  has_many :featured_contents
  has_many :articles
  has_many :tips
  has_many :values
  has_many :categories

  validates :name,         presence: true
  validates :abbreviation, presence: true, uniqueness: true

  scope :live, -> { where( live: true ) }
  scope :hidden, -> { where( live: false ) }

  scope :with_language, ->(abbreviation) { where(abbreviation: abbreviation) }

  def home_projects
    projects.featured.limit(3)
  end

  def home_content
   featured_contents.ordered
  end

  def projects_by_created_date
    projects.by_created_date
  end

  def featured_projects
    projects.featured
  end

  def published_projects
    projects.published
  end

  def live!
    self.live = true
    save!
  end

  def hide!
    self.live = false
    save!
  end

  def available?
    live?
  end

  def publication_state
    available? ? "Live" : "Hidden"
  end

  def landing_projects(landing_page)
    projects.joins(:project_technologies)
            .where(project_technologies:{technology_id:landing_page.technologies.ids})
  end

end
