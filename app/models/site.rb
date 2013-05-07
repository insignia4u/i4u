class Site < ActiveRecord::Base

  has_many :site_sections
  has_many :projects
  has_many :people
  has_many :services
  has_many :text_snippets
  has_many :featured_contents

  validates :name,         presence: true
  validates :abbreviation, presence: true, uniqueness: true

  scope :live,   where( live: true )
  scope :hidden, where( live: false )

  scope :with_language, ->(abbreviation) { where(abbreviation: abbreviation) }


  def home_projects
    projects.featured.limit(3)
  end

  def home_content
   featured_contents.limit(3)
  end

  def projects_by_created_date
    projects.by_created_date
  end

  def featured_projects
    projects.featured
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
end
